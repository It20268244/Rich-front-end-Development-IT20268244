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
var type = ($("#hidcomplaintIDSave").val() == "") ? "POST" : "PUT";
$.ajax(
{
url : "complaintsAPI",
type : type,
data : $("#formItem").serialize(),
dataType : "text",
complete : function(response, status)
{
oncomplaintSaveComplete(response.responseText, status);
}
});

function oncomplaintSaveComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);
if (resultSet.status.trim() == "success")
{
$("#alertSuccess").text("Successfully saved.");
$("#alertSuccess").show();
$("#divItemsGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
{
$("#alertError").text(resultSet.data);
$("#alertError").show();
}
} else if (status == "error")
{
$("#alertError").text("Error while saving.");
$("#alertError").show();
} else
{
$("#alertError").text("Unknown error while saving..");
$("#alertError").show();
}

$("#hidItemIDSave").val("");
$("#formItem")[0].reset();
}

// UPDATE===========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidcomplaintIDSave").val($(this).data("complaintID"));
 $("#acc").val($(this).closest("tr").find('td:eq(0)').text());
 $("#D_Type").val($(this).closest("tr").find('td:eq(1)').text());
 $("#D_Contact_Number").val($(this).closest("tr").find('td:eq(2)').text());
 $("#D_Address").val($(this).closest("tr").find('td:eq(3)').text());
 $("#D_reply").val($(this).closest("tr").find('td:eq(4)').text());
 $("#D_Status").val($(this).closest("tr").find('td:eq(5)').text());
});



$(document).on("click", ".btnRemove", function(event)
{
$.ajax(
{
url : "ItemsAPI",
type : "DELETE",
data : "itemID=" + $(this).data("itemid"),
dataType : "text",
complete : function(response, status)
{
oncomplaintDeleteComplete(response.responseText, status);
}
});
});

function oncomplaintDeleteComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);
if (resultSet.status.trim() == "success")
{
$("#alertSuccess").text("Successfully deleted.");
$("#alertSuccess").show();
$("#divItemsGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
{
$("#alertError").text(resultSet.data);
$("#alertError").show();
}
} else if (status == "error")
{
$("#alertError").text("Error while deleting.");
$("#alertError").show();
} else
{
$("#alertError").text("Unknown error while deleting..");
$("#alertError").show();
}

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
}