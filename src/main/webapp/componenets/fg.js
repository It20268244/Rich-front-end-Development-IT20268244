$(document).ready(function()
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
var method = ($("#hidcomplaintIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
	{
		url : "complaintsAPI",
		type : method,
		data : $("#formcomplaint").serialize(),
		dataType : "text",
		complete : function(response, status)
	{
		oncomplaintSaveComplete(response.responseText, status);
	}
	});
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
	
	$("#hidcomplaintIDSave").val("");
	$("#formcomplaint")[0].reset();
}

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



$(document).on("click", ".btnRemove", function(event)
{
$.ajax(
{
	url : "complaintsAPI",
	type : "DELETE",
	data : "complaintID=" + $(this).data("complaintid"),
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
}}

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
	 
	  // Check for numeric value
		var phone = $("#D_Contact_Number").val().trim();
		if (!$.isNumeric(phone)) {
			return "Insert a correct conatct number (don't insert characters)";
		}
		
		// check for length
		var pattern = /^\d{10}$/;
		if (!pattern.test(phone)) {
			return "Contact number should have 10 numbers";
	}
	
//Address
if ($("#D_Address").val().trim() == "")
	 {
		 return "Insert message.";
	 }



return true;
}/**
 * 
 */