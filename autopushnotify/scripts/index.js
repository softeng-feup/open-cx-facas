const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

var msgData; 

exports.notifyPresentationUpdate = functions.firestore.document(
        'presentations/{presentationID}'
    ).onUpdate((change, context) => {
        msgData = change.after.data();
  
        admin.firestore().collection('pushtokens').get().then((snapshots) =>{
            var tokens = []; 
            if(snapshots.empty){
                console.log('No Devices'); 
            }
            else{
                for(var token of snapshots.docs){
                    tokens.push(token.data().devtoken);
                }

                var payload = {
                    "notification": {
                        "title": "Presentation "+msgData.Name+" Updated", 
                        "body": "Date: "+ msgData.Date + " Room "+msgData.Room, 
                        "sound": "default"
                    },
                    "data": {
                        "sendername": msgData.Name,
                        "message": "Date" + msgData.Date
                    }
                }
                console.log('notifyin...'); 
                return admin.messaging().sendToDevice(tokens, payload).then((response) =>{
                    console.log('Pushed them all');
                    return;
                }).catch((err) =>{
                    console.log(err);
                })
            }
            return;
        }).catch((err) =>{
            console.log(err);
    })
})