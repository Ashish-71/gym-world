<?php 
require('top.php');
?>

<!-- Start Bradcaump area -->
<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center / cover ;">
    <div class="ht__bradcaump__wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="bradcaump__inner">
                        <nav class="bradcaump-inner">
                          <a class="breadcrumb-item" href="index.php">Home</a>
                          <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                          <span class="breadcrumb-item active">about us</span>

                          <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                      </nav>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
<!-- End Bradcaump area -->
<!-- Start Product Details Area -->


<section class="htc__product__details bg__white ptb--100">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
 
  margin: 23px 81px;
  box-shadow: 
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  margin-left: 200px;
}
.ashish{
  border-radius: 7px;
  max-width: 100%;
  border: #F8E70D solid 10px;
  box-shadow: 0 0 15px rgb(248 251 247 / 48%);
  margin: 0 0px 45px -204px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
  margin-left: -221px;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 15%;
}

.button:hover {
  background-color: white;
  color: black;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>



<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img class="ashish" src="media/product/gg.jpg"  style="width:100%">
      <div class="container">
        <h2> Ashish Soni</h2>
        <p class="title">Owner</p>
        <p>If you're looking for an opportunity to grow at a company that'<br> empowered, inclusive, and values great work.</p>
        <p>aashishsoni71001@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img class="ashish" src="media/product/12.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Shrey Patel</h2>
        <p class="title">Manager</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>mike@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

</body>
</section>
    <!-- Start Product Details Top -->
  
<!-- End Product Details Top -->
<!-- End Product Details Area 
          <!-- Start Product Description -->
          
          <section class="htc__produc__decription bg__white">
             
        </section>
    <!-- End Product Description -->

        
    
    
    <?php require('footer.php')?>        R