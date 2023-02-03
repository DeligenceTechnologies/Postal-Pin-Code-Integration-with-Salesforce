# Postal-Pin-Code-Integration-with-Salesforce
Postal PIN Code API allows developers to get details of Post Office by searching **Postal PIN Code** or **Post Office Branch Name** of India.The API accepts HTTP 'GET' calls and returns JSON formatted responses.There can be multiple Json objects for single Pincode with different Postal Index address/location Information.

## Parameters:
**Example 1** (Search by Postal PIN Code):
To get details of a PIN Code (`110001`), use following query
https://api.postalpincode.in/pincode/110001

**Example 2** (Search by Post Office Branch Name):
To get details of a Post Office Branch details (`New Delhi`), use following query
https://api.postalpincode.in/postoffice/New Delhi

## Returns:
`Name`
`Branch Type`
`Delivery Status`
`Circle`
`District`
`Division`
`Region`
`Block`
`State`
`Country`
`Pincode`

## Read all about PinCode API
http://www.postalpincode.in/Api-Details
