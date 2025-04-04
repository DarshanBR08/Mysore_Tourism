<%@page import="com.mysore.dto.Packages"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Booking</title>
	<style>
		*{
			padding:0px;
			margin:0px;
		box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

      
      body {
      	width:100%;
      	height:100vh;
    background: linear-gradient(to right, #f5deb3, #ffffff);
}
nav{
     width:100%;
    display: flex;
    justify-content: right;
    align-items: center;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 15px 20px;
    height:60px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    position:fixed;
    z-index:1;
}

 button{
        padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		border:none;
		color:#ffff;
        	height:35px;
			margin:10px;
			transition: all 0.3s;
			align-items:center;
			text-align:center;
		}
		
		button:hover{
		transform: scale(1.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}

		section{
			display:flex;
			flex-direction: column;
			width:100%;
			position:absolute;
			top:13%;
		}
		.label h1{
			font-size: 40px;
			padding-left: 50px;
		}
		.main{
			display:flex;
			flex-direction: column;
			align-items: center;
			width:100%;
		}
        .details{
        	width:90%;
        	display:flex;
        	align-items: center;
        	justify-content: center;
        }
        .details div{
          width:50%;
        }
        .details-right{
        	display:flex;
        	flex-direction: column;
        	align-items: center;
        }
        .details-right-child{
        	display:flex;
        	flex-direction: row;
        	align-items:center;
        	justify-content: space-around;
        	border:3px solid black;
        	border-radius: 10px;
        	margin:10px;
        	padding: 10px;
        }
        
		img{
			width:50px;
		}
		a{
			decoration:none;
			color:white;
		}
		.note,.Terms-condition,.inclusion{
			border:2px solid #825a5a;
			margin: 20px;
		}
        .note_details, .terms-details {
    height: auto;
    padding: 0 40px;
    font-size: 15px;
    overflow: hidden;
    transition: max-height 0.5s ease, opacity 0.5s ease;
    opacity: 0;
    visibility: hidden;
    max-height: 0;
}
.inclusion_details{
 height: auto;
    padding: 10px 20px;
    font-size: 15px;
    transition: max-height 0.5s ease, opacity 0.5s ease;
    }

/* Icon rotation */
.rotate {
    transform: rotate(180deg);
    transition: transform 0.3s ease;
}
        .note-head,.terms-head,.inclusion-head{
        	display:flex;
        	justify-content: space-between;
        	color:white;
        	padding: 10px;
        	height:50px;
        	background-color: #825a5a;
        }
        li{
        	margin-bottom: 7px;
        }
        
        .sm button{
        	margin: 0px;
        	padding:0px;
        	background: none;
        }
        .sm button:hover{
        	transform: scale(1.1);
            box-shadow: none;
        }
        .sm img{
        	width:30px;
        }
        .inclusion_details p{
        padding:10px 30px ;
        }
        
        .inclusion_details ul{
        padding:10px 60px ;
        }
        
	</style>
</head>
<body>
<nav>
	<button><a href="packagedetails.jsp">BACK</a></button>
</nav>
<%Packages p=(Packages)request.getAttribute("package");%>
<section>
<div class="label">
		<h1><%=p.getPackagename() %></h1>
	</div>
<div class="main">
	
	<div class="details">

		<div class="details-left">
			<p>This package spans <%=p.getNo_of_days() %> days and <%=p.getNo_of_nights() %> nights of travel.
It starts on <%=p.getStartdate() %> and concludes on <%=p.getEnddate() %>.
The last date to register for the package is <%=p.getLastdate() %>.
Don't miss this exciting travel opportunity!</p>

		</div>
		<div class="details-right">

      <div class="duration details-right-child">
      	<div class="img">
      		<img src="Images/calendar.png" alt="calender">
      	</div>
      	<div class="imgdetail">
      		<h4>Duration</h4>
      		<h3><%=p.getNo_of_days() %> Day</h3>
      		<p>(<%=p.getNo_of_days() %> Days | <%=p.getNo_of_nights() %> Nights)</p>
      	</div>
      </div>
       <div class="departure_location details-right-child">
       	   <div class="img">
      		<img src="Images/location.png" alt="location">
      	</div>
      	<div class="imgdetail">
      		<h4>Departure Location</h4>
      		<h3>Mayura Hotel</h3>
      	</div>
       </div>
       <div class="departure-time details-right-child">
           <div class="img">
      		<img src="Images/clock.png" alt="time">
      	</div>
      	<div class="imgdetail">
      		<h4>Departure Time</h4>
      		<h3>6:30am</h3>
      	</div>

       </div>
       <div class="contact details-right-child">
           <div class="img">
      		<img src="Images/phone.png" alt="contact">
      	</div>
      	<div class="imgdetail">
      		<h4>Contact No</h4>
      		<h3>8245678765</h3>
      	</div>

       </div>

	</div>
</div>
<div class="add-details">
	<div class="note">
		      <!-- Note -->
<div class="note-head">
    <h2>Note</h2>
    <div class="sm">
        <button class="toggle-note"><img src="Images/plus.png" alt="toggle" class="note-icon"></button>
    </div>
</div>


		<div class="note_details">
			<ul>
				<li>The ticket fares are inclusive of applicable Goods & Service Tax (GST).</li>
				<li>For Mysore trips, Chamundi Hills will not be covered on Friday’s during the month of Ashada only. Mysore Zoo will be closed on every Tuesday. Please note: For Trip code MSS, during Special Pooja Days in Dussehra, will not be possible to enter Chamundi Hills and Palace.</li>
				<li>All Passengers shall produce the Identity Proof compulsory for the TPT and TKT Trips (Any of the ID proof like, Voter ID (For Resident Indians Only) / Passport / Driving License / PAN Card (For Resident Indians only) / Photo Credit Card / Employers ID card with Photo) Dress Code for Tirupathi – Men: Dhoti and Shirt, Women: Chudidar along with Duppatta or Saree.</li>
				<li>Only extra Mattress will be provided to the third person in triple sharing accommodation.</li>
				<li>Tours like Thirupathi, Jog Falls and South Canara, 4 people will be allotted a room for freshening up.</li>
			</ul>
		</div>
	</div>

	<div class="Terms-condition">
		<!-- Terms -->
<div class="terms-head">
    <h2>Terms and Condition</h2>
    <div class="sm">
        <button class="toggle-terms"><img src="Images/plus.png" alt="toggle" class="terms-icon"></button>
    </div>
</div>

		<div class="terms-details">
			<ol>
				<li>The Corporation undertakes no liability in case of cancellation of trips due to breakdown or for reasons beyond the control of the management. However, proportionate refund of fare will be allowed in case of no alternate arrangement is made. During the course of operation of tour, if any sightseeing places are missed on account of sudden unforeseen happenings, the KSTDC is not responsible.</li>
				<li>Incase of any issues related to booking of ticktes, preponement/postponement of tickets  or cancellation of tickets kindly send the mail to reserve@karnatakaholidays.net</li>
				<li>Tickets are not transferable.</li>
				<li>Management is not responsible for luggage/baggage and Personal belongings of the tourists.</li>
				<li>Tourists are requested to take personal care about their Luggage/Belongings.</li>
				<li>The management reserves the right to cancel the trip in case the numbers of seats booked are less than 15 and for any such other reasons.</li>
				<li>The ticket is valid for the particular journey to which it is issued.
				<li>Children above the age of 5 years will be charged full fare. No seats will be given to children below 5 years. (Age proof Required)</li>
				<li>Passengers are requested to report 15 minutes in advance. The bus will not wait for passenger who arrives late.</li>
				<li>Smoking and consumption of alcohol is strictly prohibited in the coach.<li>Purchasing articles from other than Govt. shops is at their own risk.</li>
				<li>The Corporation shall neither be responsible nor refund the amount in case the tourists miss the bus on account of late reporting to the pickup point.</li>
				<li>Tipping the staff including the Guide is strictly prohibited. They are paid by KSTDC except for BHS trip.</li><li>Pets and Animals not allowed inside the bus while on Journey.</li>
				<li>15.The management has all the right to make the passengers to get down from the bus, who are travelling on invalid tickets, disturbing the co-passengers & drunken passengers, without any refund.</li>
				<li>No postponement of journey will be made within 24 hours. There is no refund on cancellation of one time Preponed/Postponed ticket.</li>
				<li>Tariff is subject to change without notice.</li>
				<li>Accommodation is subject to availability of the rooms and they are subject to change without prior notice.</li>
				<li>Senior Citizens are provided with 20% discount on transportation by default while booking ticket. Hence they must produce valid proof.</li>
				<li>The management shall not be liable for third party suppliers including arrangements with accommodation providers, activity providers and local guides and other independent parties (Third party suppliers) to provide you with some or all the components of your bookings.</li>
				<li>The management shall not be liable and will not assume responsibility for any claims, losses, damages, costs or expenses arising out of inconvenience, loss of enjoyment, upset, disappointed, distress or frustration, whether physical or mental, resulting from the act or omission of any party other than Tour Operator and its employees.</li>
				<li>The management resources all the right to update or alter their terms and condition at any time, and will post the amended terms and condition in the tour package.</li>
				<li>The package tour tariff includes only accommodation and transportation costs, the other charges like food, entrance tickets, etc.. should be borne by tourists themselves.</li>
				<li>Passengers booked the tickets through online can now Cancel/Modify the tickets through their login from KSTDC website by logging in to your account.</li>
				<li>In case of any cancellation/ modifications to be done for the tickets booked for Tirupathi package, the details to be mailed to reserve@karnatakaholidays.net within 05:30pm on working days before 7 days of date of journey.
				</li>
			</ol>
		</div>
	</div>
	
	<div class="inclusion">
		      
<div class="inclusion-head">
    <h2>Inclusion/Exclusion</h2>
</div>

		<div class="inclusion_details">
		<p>Inclusions</p>
<ul>
  <li>✅ Accommodation in selected category hotel (NA for Day Trips)</li>
  <li>✅ Breakfast during stay, unless mentioned in Hotel Details section for selected hotel</li>
  <li>✅ Sightseeing as per Itinerary by Private Cab</li>
  <li>✅ Parking & Toll Charges</li>
  <li>✅ Driver Allowance</li>
  <li>✅ Inter-state Entry Tax, if applicable</li>
  <li>✅ Ferry Tickets & Airport Transfers (for Andamans)</li>
  <li>✅ Pickup & Drop from Your Origin City (Optional)</li>
  <li>✅ Total fare includes GST</li>
</ul>
			 


<p>Exclusions</p>
<ul>
  <li>❌ Airfare</li>
  <li>❌ Lunch, Dinner, Snacks & Beverages</li>
  <li>❌ Entry Fees & Local Guide Charges</li>
  <li>❌ Activity Fees / Jeep Safari / Rafting / Boating / Adventure Sport Charges</li>
  <li>❌ Hotel Early Check-in / Late Check-out Charges, if applicable</li>
  <li>❌ Mandatory Gala Dinner for Christmas and New Year eve</li>
  <li>❌ Other items not mentioned in Inclusions</li>
</ul>



<p>Optional(arrangement based on client request)</p>
<ul>
  <li>➕ Homestays / Resorts / Choice of Hotels</li>
  <li>➕ Dinner</li>
  <li>➕ Tour guide (for selected destinations)</li>
  <li>➕ Honeymoon decoration, cake, candle light dinner (for selected properties)</li>
  <li>➕ Airport Pickup & Drop (select by clicking Customize button while calculating price)</li>
  <li>➕ Visa assistance (for selected International destinations)</li>
</ul>


		</div>
</div>
</div>
</section>
<script>
    const noteBtn = document.querySelector(".toggle-note");
    const noteIcon = document.querySelector(".note-icon");
    const noteDetails = document.querySelector(".note_details");

    const termsBtn = document.querySelector(".toggle-terms");
    const termsIcon = document.querySelector(".terms-icon");
    const termsDetails = document.querySelector(".terms-details");

    // Function to toggle visibility and icon
    function toggleSection(button, icon, details, plusImg, minusImg) {
        const isOpen = details.style.maxHeight !== "0px" && details.style.maxHeight !== "";

        if (isOpen) {
            details.style.maxHeight = "0";
            details.style.opacity = "0";
            details.style.visibility = "hidden";
            icon.src = plusImg;
            icon.classList.remove("rotate");
        } else {
            details.style.maxHeight = details.scrollHeight + "px";
            details.style.opacity = "1";
            details.style.visibility = "visible";
            icon.src = minusImg;
            icon.classList.add("rotate");
        }
    }

    noteBtn.addEventListener("click", () => {
        toggleSection(noteBtn, noteIcon, noteDetails, "Images/plus.png", "Images/minus.png");
    });

    termsBtn.addEventListener("click", () => {
        toggleSection(termsBtn, termsIcon, termsDetails, "Images/plus.png", "Images/minus.png");
    });

    // Initialize hidden state
    noteDetails.style.maxHeight = "0";
    termsDetails.style.maxHeight = "0";
</script>


</body>
</html>