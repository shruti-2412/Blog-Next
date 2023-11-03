<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog : Home Page</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;1,600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
</head>
<body>

	<!-- NAVBAR -->


	<nav class="navbar">
		<img src="img/blog_logo.png" class="logo" alt="">
		<ul class="links-container">
			<li class="link-item"><a href="/" class="link">home</a></li>
			<li class="link-item"><a href="/editor" class="link">editor</a></li>
		</ul>
	</nav>


	<!-- HEADER -->


	<header class="header">
		<div class="content">
			<h1 class="heading">
				<span class="small">welcome in the world of</span> blog 
				<span class="no-fill">writing</span>
			</h1>
			<a href="/editor" class="btn">write a blog</a>
		</div>
	</header>
	

	<!-- BLOG SECTION CARD (MADE ONE CARD , AS WE WILL MAKE CARDS WITH JSP LATER) -->


	<section class="blogs-section" id="blogContainer">
	 <div class="blog-card">
			<img src="img/header_img.jpg" class="blog-image" alt="">
			<h1 class="blog-title">Lorem ipsum dolor sit amet consectetur.</h1>
			<p class="blog-overview">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Sunt incidunt fugiat quos porro repellat harum.
				Adipisci tempora corporis rem cum.</p>
			<p class="blog-writtenBy">Lorem ipsum</p>
			<p class="blog-timestamp">Lorem ipsum</p>
			<a href="/" class="btn dark">read</a>
		</div>
	</section>

</body>

<script>
    $(document).ready(function() {
        function displayBlogData() {
            $.ajax({
                type: 'GET',
                url: 'AllBlogsServlet',
                dataType: 'json',
                success: function(data) {
                    // Log the received data to the console
                    console.log(data);

                    // Attempt to parse the data
                    try {
                    	var jsonData = data;
                        var blogContainer = document.getElementById("blogContainer");

                        for (var i = 0; i < jsonData.length; i++) {
                            var blog = jsonData[i];
                            var blogElement = document.createElement("div");
                            //blogElement.innerHTML = "<h3>" + blog['blog-title'] + "</h3><p>" + blog['blog-overview'] + "</p><p>Written By: " + blog['blog-writtenBy'] + "</p><p>Timestamp: " + blog['blog-timeStamp'] + "</p>";

                            blogContainer.appendChild(blogElement);
                        }
                    } catch (error) {
                        console.log('Error parsing JSON data: ' + error);
                    }
                },
                error: function() {
                    console.log('Failed to retrieve data from the servlet.');
                }
            });
        }

        displayBlogData();
    });
</script>

</html>