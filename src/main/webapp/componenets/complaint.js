$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
 
// Form validation-------------------
var status = validatecomplaintForm();
if (status != true)
 {
 $("#alertError").text(status);
 $("#alertError").show();
 return;
 }
// If valid------------------------
 $("#formcomplaint").submit();
});

// UPDATE===========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidcomplaintIDSave").val($(this).closest("tr").find('#hidcomplaintIDUpdate').val());
 $("#acc").val($(this).closest("tr").find('td:eq(0)').text());
 $("#D_Type").val($(this).closest("tr").find('td:eq(1)').text());
 $("#D_Contact_Number").val($(this).closest("tr").find('td:eq(2)').text());
 $("#D_Address").val($(this).closest("tr").find('td:eq(3)').text());
 $("#D_reply").val($(this).closest("tr").find('td:eq(4)').text());
 $("#D_Status").val($(this).closest("tr").find('td:eq(5)').text());
});

// CLIENTMODEL=========================================================================
function validatecomplaintForm()
{
//account number
if ($("#acc").val().trim() == "")
 {
 return "Insert  account number.";
 }
// complaint type
if ($("#D_Type").val().trim() == "")
 {
 return "Insert complaint type.";
 }
// Contact number-------------------------------
if ($("#D_Contact_Number").val().trim() == "")
 {
 return "Insert Contact Number.";
 }
//Address
if ($("#D_Address").val().trim() == "")
 {
 return "Insert message.";
 }
//reply
if ($("#D_reply").val().trim() == "")
 {
 return "Insert reply message.";
 }



return true;
}/**
 * 
 */