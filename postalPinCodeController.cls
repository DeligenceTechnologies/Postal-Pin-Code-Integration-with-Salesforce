public class postalPinCodeController {
    public string pinCodeNumber{get;set;}
    public string jsonResponse{get;set;}
    public list<PostOfficeBranch> lstPostalBranches{get;set;}
    public void searchBranchDetails(){
        
        lstPostalBranches = new list<PostOfficeBranch>();
        
        if(pinCodeNumber != null && pinCodeNumber !=''){
            //invoke the webservice and get the response
            string endPointURL ='https://api.postalpincode.in/pincode/'+pinCodeNumber;
            
            httpRequest pRequest = new httpRequest();
            pRequest.setEndpoint(endPointURl);
            pRequest.setMethod('GET');
            pRequest.setTimeout(12000);
            
            httpResponse pResponse = new httpResponse();
            http pHttp = new http();
            
            pResponse = pHttp.send(pRequest);
            jsonResponse = pResponse.getBody();
            //pass the response by using JSONParser and represent on the VF Page.
            system.JSONParser pParser = system.Json.createParser(pResponse.getBody());
           while(pParser.nextToken()!= null){
                /*if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='Message'){
                    pParser.nextToken();
                    system.debug('Number of Branches Found : '+pParser.getText());            
                }
                if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='Status'){
                    pParser.nextToken();
                    system.debug('Status : '+pParser.getText());            
                }*/
                if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='PostOffice'){
                    pParser.nextToken();
                    if(pParser.getCurrentToken()==JsonToken.START_ARRAY){
                        pParser.nextToken();
                        while(pParser.getCurrentToken()== JsonToken.START_OBJECT){
                          PostOfficeBranch branchInfo = (PostOfficeBranch)pParser.readValueAs(PostOfficeBranch.class);
                            lstPostalBranches.add(branchInfo);
                            
                            pParser.nextToken();
                        }
                    }          
                }
            }
        }
    }
}