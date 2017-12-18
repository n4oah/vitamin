<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
	<span class="showSelect btn-secondary" data-target="#ddCountries" id="ddCountriesBtn">서울</span>
	<span class="showSelect btn-secondary" data-target="#ddStates"  id="ddStatesBtn">경기도<span class="arrow"></span></span>
	<span class="showSelect btn-secondary" data-target="#ddCategories" id="ddCategoriesBtn">Select Categories <span class="arrow"></span></span>

<div class="optContainer" id="ddCountries">
	<c:forEach items="${cityList }" var="city">
    	<label class="checked"><input type="checkbox" name="name"><b>${city.subName }</b></label>
	</c:forEach>
	
    <h5>Countries</h5>
    <label class="checked"><input type="checkbox" checked>United States</label>
    <label class="checked"><input type="checkbox" checked>Australia</label>
    <label class="checked"><input type="checkbox" checked>Belize</label>
    <label class="checked"><input type="checkbox" checked>Brazil</label>
    <label class="checked"><input type="checkbox" checked>Canada</label>
    <label class="checked"><input type="checkbox" checked>Caribbean Islands</label>
    <label><input type="checkbox">China</label>
    <label><input type="checkbox">Finland</label>
    <label><input type="checkbox">France</label>
    <label><input type="checkbox">Georgia</label>
    <label><input type="checkbox">Germany</label>
    <label><input type="checkbox">Greece</label>
    <label><input type="checkbox">Israel</label>
    <label><input type="checkbox">Korea (South)</label>
    <label><input type="checkbox">Netherlands</label>
    <label><input type="checkbox">New Zealand</label>
    <label><input type="checkbox">Portugal</label>
    <label><input type="checkbox">Puerto Rico</label>
    <label><input type="checkbox">Singapore</label>
    <label><input type="checkbox">South Africa</label>
    <label><input type="checkbox">Spain</label>
    <label><input type="checkbox">Switzerland</label>
    <label><input type="checkbox">U.A.E.</label>
    <label><input type="checkbox">United Kingdom</label>
    <label><input type="checkbox">Virgin Islands</label>
    <div class="changes">
        <button class="btn-primary">Save Changes</button>
        <button class="btn-secondary" data-target="#ddCategories">Cancel</button>
    </div>  
</div>

<div class="optContainer" id="ddStates">
    <label class="checked"><input type="checkbox" name="name"><b>Select All States</b></label>
    <h5>U.S. States </h5>
    <label class="checked"><input type="checkbox" checked>Alabama</label>
    <label class="checked"><input type="checkbox" checked>Alaska</label>
    <label class="checked"><input type="checkbox" checked>Arizona</label>
    <label class="checked"><input type="checkbox" checked>Arkansas</label>
    <label class="checked"><input type="checkbox" checked>California</label>
    <label class="checked"><input type="checkbox" checked>Colorado</label>
    <label><input type="checkbox">Connecticut</label>
    <label><input type="checkbox">Delaware</label>
    <label><input type="checkbox">District of Columbia</label>
    <label><input type="checkbox">Florida</label>
    <label><input type="checkbox">Georgia</label>
    <label><input type="checkbox">Hawaii</label>
    <label><input type="checkbox">Idaho</label>
    <label><input type="checkbox">Illinois</label>
    <label><input type="checkbox">Indiana</label>
    <label><input type="checkbox">Iowa</label>
    <label><input type="checkbox">Kansas</label>
    <label><input type="checkbox">Kentucky</label>
    <label><input type="checkbox">Louisiana</label>
    <label><input type="checkbox">Maine</label>
    <label><input type="checkbox">Maryland</label>
    <label><input type="checkbox">Massachusetts</label>
    <label><input type="checkbox">Michigan</label>
    <label><input type="checkbox">Minnesota</label>
    <label><input type="checkbox">Mississippi</label>
    <label><input type="checkbox">Missouri</label>
    <label><input type="checkbox">Montana</label>
    <label><input type="checkbox">Nebraska</label>
    <label><input type="checkbox">Nevada</label>
    <label><input type="checkbox">New Hampshire</label>
    <label><input type="checkbox">New Jersey</label>
    <label><input type="checkbox">New Mexico</label>
    <label><input type="checkbox">New York</label>
    <label><input type="checkbox">North Carolina</label>
    <label><input type="checkbox">North Dakota</label>
    <label><input type="checkbox">Ohio</label>
    <label><input type="checkbox">Oklahoma</label>
    <label><input type="checkbox">Oregon</label>
    <label><input type="checkbox">Pennsylvania</label>
    <label><input type="checkbox">Rhode Island</label>
    <label><input type="checkbox">South Carolina</label>
    <label><input type="checkbox">South Dakota</label>
    <label><input type="checkbox">Tennessee</label>
    <label><input type="checkbox">Texas</label>
    <label><input type="checkbox">Utah</label>
    <label><input type="checkbox">Vermont</label>
    <label><input type="checkbox">Virginia</label>
    <label><input type="checkbox">Washington</label>
    <label><input type="checkbox">West Virginia</label>
    <label><input type="checkbox">Wisconsin</label>
    <label><input type="checkbox">Wyoming</label>
    <div class="changes">
        <button class="btn-primary">Save Changes</button>
        <button class="btn-secondary" data-target="#ddCategories">Cancel</button>
    </div>  
</div>

<div class="optContainer" id="ddCategories">
    <label class="checked"><input type="checkbox" name="name" checked><b>Select all business types</b></label>
    <h5>Retailing Businesses <a href="">Select all</a></h5>
    <label class="checked"><input type="checkbox" checked>Apparel and Accessory Stores</label>
    <label class="checked"><input type="checkbox" checked>Automotive Dealers</label>
    <label class="checked"><input type="checkbox" checked>Bars/Taverns</label>
    <label class="checked"><input type="checkbox" checked>Blding Mat., Hardware, Garden</label>
    <label class="checked"><input type="checkbox" checked>Convenience Stores</label>
    <label class="checked"><input type="checkbox" checked>Florists</label>
    <label><input type="checkbox">Gasoline Service Stations</label>
    <label><input type="checkbox">General Merchandise Stores</label>
    <label><input type="checkbox">Home Furniture &amp; Furnishings</label>
    <label><input type="checkbox">Liquor Stores</label>
    <label><input type="checkbox">Marine Dealers &amp; Equipment</label>
    <label><input type="checkbox">Miscellaneous Retail</label>
    <label><input type="checkbox">Other Eating &amp; Drinking Places</label>
    <label><input type="checkbox">Other Food Stores</label>
    <label><input type="checkbox">Pet Shops &amp; Supplies</label>
    <label><input type="checkbox">Restaurants</label>
    <label><input type="checkbox">Supermarkets</label>
    <label><input type="checkbox">Vending Machines</label>
    <div class="changes">
        <button class="btn-primary">Save Changes</button>
        <button class="btn-secondary" data-target="#ddStates">Cancel</button>
    </div>  
</div>

<script src="https://code.jquery.com/jquery.js"></script>
<script>
$(":checkbox").on('click', function(){
    $(this).parent().toggleClass("checked");
});

$(".optContainer").hide();

$(".showSelect").click(function () {
   $(this).toggleClass("open").siblings("span").removeClass("open");
   $($(this).data("target")).fadeToggle('fast').siblings("div.optContainer").hide();
});
$(".changes button").click(function () {
   var myid = $(this).parent().parent().attr('id');
   $('#'+myid+'Btn').click();
});
</script>
</body>
</html>