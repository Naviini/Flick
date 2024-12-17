
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- <meta charset="UTF-8"> -->
         <meta naame="viewport" content="width=device-width, intial-scale=1.0">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

         <link rel="stylesheet" href="css/booking.css">
         <title>Nav|Book your seat</title>
    </head>
    <body class="booking_body">
        <div class="book">
            <div class="left">
             <img src="/images/Gladiator movie 1.1.jpg" alt="movie 1" class="img">
               <div class="play">
                  <i class="bi bi-play-fill" id="play"></i>
               </div>
                <div class="cont">
                    <h6>Directed by</h6>
                    <p>Ridley Scott</p>
                    <h6>Story by</h6>
                    <p>	David Franzoni</p>
                    <!-- <h6>Screenplay by</h6>
                    <p> David Franzoni
                        John Logan
                        William Nicholson</p>
                    <h6>Produced by</h6>
                    <p> Douglas Wick
                        David Franzoni
                        Branko Lustig</p> -->
                    <h6>Music by</h6>
                    <p> Hans Zimmer ,
                        Lisa Gerrard</p>
                    <h6>Starring</h6>
                    <p> Russell Crowe ,
                        Joaquin Phoenix<br>
                        Connie Nielsen ,
                        Oliver Reed<br>
                        Derek Jacobi ,
                        Djimon Hounsou<br>
                        <!-- Richard Harris -->
                    <!-- </p>
                    <h6>Production
                        companies</h6>
                    <p> DreamWorks Pictures[1]<br>
                        Universal Pictures<br> -->
                        <!-- Scott Free Productions<br> -->
                        <!-- Red Wagon Entertainment</p> -->
                </div>
            </div>
            <!-- Left side of page -->
            <div class="right">
                <!-- Backgroung Trailer -->
                 <video src="trailers/Gladiator trailer 1.mp4" id="video"autoplay></video>
                <!-- Movie title -->
                <div class="head_time"> 
                    <h1>Gladiator</h1>
                        <!-- Movie duration -->
                        <div class="time">
                            <h6><i class="bi bi-clock"></i>155 minutes</h6>
                            <!-- <button>PG-13</button> -->
                        </div>
                </div>
                <!-- Data on the right of the page -->
                    <div class="data_type">
                        <!-- Left Card of the Right side of the page -->
                        <div class="left_card">
                            <h6 class="title">Monday 4th of Nov</h6>
                              <!-- Dates of the month-->
                                <div class="card_month crd">
                                    <li>
                                        <h6>Mon</h6>
                                        <h6 class="date_point">1</h6>
                                    </li>
                                    <li>
                                        <h6 >Tue</h6>
                                        <h6 class="date_point">2</h6>
                                    </li>
                                    <li>
                                        <h6>Wed</h6>
                                        <h6 class="date_point">3</h6>
                                    </li>
                                    <li>
                                        <h6>Thu</h6>
                                        <h6 class="date_point">4</h6>
                                    </li>
                                    <li>
                                        <h6>Fri</h6>
                                        <h6 class="date_point">5</h6>
                                    </li>
                                    <li>
                                        <h6>Sat</h6>
                                        <h6 class="date_point">6</h6>
                                    </li>
                                    <li>
                                        <h6>Sun</h6>
                                        <h6 class="date_point h6_active">7</h6> 
                                    </li>
                                    <li>
                                        <h6>Mon</h6>
                                        <h6 class="date_point">8</h6>
                                    </li>
                                    <li>
                                        <h6 >Tue</h6>
                                        <h6 class="date_point">9</h6>
                                    </li>
                                    <li>
                                        <h6>Wed</h6>
                                        <h6 class="date_point">10</h6>
                                    </li>
                                    <li>
                                        <h6>Thu</h6>
                                        <h6 class="date_point">11</h6>
                                    </li>
                                    <li>
                                        <h6>Fri</h6>
                                        <h6 class="date_point">12</h6>
                                    </li>
                                    <li>
                                        <h6>Sat</h6>
                                        <h6 class="date_point">13</h6>
                                    </li>
                                    <li>
                                        <h6>Sun</h6>
                                        <h6 class="date_point">14</h6>
                                    </li>
                                    <li>
                                        <h6>Mon</h6>
                                        <h6 class="date_point">15</h6>
                                    </li>
                                    <li>
                                        <h6 >Tue</h6>
                                        <h6 class="date_point">16</h6>
                                    </li>
                                    <li>
                                        <h6>Wed</h6>
                                        <h6 class="date_point">17</h6>
                                    </li>
                                    <li>
                                        <h6>Thu</h6>
                                        <h6 class="date_point">11</h6>
                                    </li>
                                    <li>
                                        <h6>Fri</h6>
                                        <h6 class="date_point">12</h6>
                                    </li>
                                    <li>
                                        <h6>Sat</h6>
                                        <h6 class="date_point">13</h6>
                                    </li>
                                    <li>
                                        <h6>Sun</h6>
                                        <h6 class="date_point">14</h6>
                                    </li>
                                    <li>
                                        <h6>Mon</h6>
                                        <h6 class="date_point">15</h6>
                                    </li>
                                </div> 
                        </div>
                     <!-- </div> -->
                        <!-- Right Card of the Right side of the page -->
                        <!-- <div class="right_card crd"> -->
                        <div class="right_card">
                            <h6 class="title">Show times</h6>
                                <div class="card_month crd">
                            <li>
                                <h6>2D</h6>
                                <h6>9.30pm</h6>
                            </li>
                            <li>
                                <h6>2D</h6>
                                <h6>12.30pm</h6>
                            </li>
                            <li>
                                <h6>2D</h6>
                                <h6>9.00pm</h6>
                            </li>
                            <li>
                                <h6>3D</h6>
                                <h6>9.30pm</h6>
                            </li>
                            <li>
                                <h6>3D</h6>
                                <h6 class="h6_active">12.30pm</h6>   
                            </li>
                            <li>
                                <h6>4D</h6>
                                <h6>9.00pm</h6>
                            </li>    
                        </div>
                    </div>
            </div>

            <!-- SCREEN  -->
            <div class="screen">
                Screen
            </div>

                <!-- chairs -->
                <div class="chair">
                    <div class="row">
                        <!-- <span>J</span> -->
                        <!-- <div class="chair"> -->
                            <!-- <div class="row"> -->
                              <!-- <ul id="seats-list"> -->
                                <!-- The <li> elements will be added here dynamically -->
                              <!-- </ul> -->
                            <!-- </div> -->
                          <!-- </div> -->
                        <!-- <ul id="seats-list"> --> 
                            <li class="seat" id="seats-list">H1</li>
                            <li class="seat" id="seats-list">H2</li>
                            <li class="seat" id="seats-list">H3</li>
                            <li class="seat" id="seats-list">H4</li>
                            <li class="seat" id="seats-list">H5</li>
                            <li class="seat" id="seats-list">H7</li>
                            <li class="seat" id="seats-list">H8</li>
                            <li class="seat" id="seats-list">H9</li>
                            <li class="seat" id="seats-list">H10</li>
                            <li class="seat" id="seats-list">H11</li>
                            <li class="seat" id="seats-list">H12</li>
                            <li class="seat" id="seats-list">H13</li>
                            <li class="seat" id="seats-list">H14</li>
                            <li class="seat" id="seats-list">H15</li>
                            <li class="seat" id="seats-list">H16</li>
                            <li class="seat" id="seats-list">H17</li>
                            <li class="seat" id="seats-list">H18</li>
                            <li class="seat" id="seats-list">H19</li>
                            <li class="seat" id="seats-list">H20</li>
                            <li class="seat" id="seats-list">H21</li>
                            <li class="seat" id="seats-list">H22</li>
                            <li class="seat" id="seats-list">H23</li>
                            <li class="seat" id="seats-list">H24</li>
                            <li class="seat" id="seats-list">H25</li>
                            <!-- <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li>
                            <li class="seat"></li> -->
                    <!-- </ul> -->
                        <!-- <span>J</span>   -->
                    </div>

                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                    <div class="row">
                        <li class="seat" id="seats-list">H1</li>
                        <li class="seat" id="seats-list">H2</li>
                        <li class="seat" id="seats-list">H3</li>
                        <li class="seat" id="seats-list">H4</li>
                        <li class="seat" id="seats-list">H5</li>
                        <li class="seat" id="seats-list">H7</li>
                        <li class="seat" id="seats-list">H8</li>
                        <li class="seat" id="seats-list">H9</li>
                        <li class="seat" id="seats-list">H10</li>
                        <li class="seat" id="seats-list">H11</li>
                        <li class="seat" id="seats-list">H12</li>
                        <li class="seat" id="seats-list">H13</li>
                        <li class="seat" id="seats-list">H14</li>
                        <li class="seat" id="seats-list">H15</li>
                        <li class="seat" id="seats-list">H16</li>
                        <li class="seat" id="seats-list">H17</li>
                        <li class="seat" id="seats-list">H18</li>
                        <li class="seat" id="seats-list">H19</li>
                        <li class="seat" id="seats-list">H20</li>
                        <li class="seat" id="seats-list">H21</li>
                        <li class="seat" id="seats-list">H22</li>
                        <li class="seat" id="seats-list">H23</li>
                        <li class="seat" id="seats-list">H24</li>
                        <li class="seat" id="seats-list">H25</li>
                    </div>
                </div>

                <!-- Details  -->
                <div class="details" id="det">
                    <div class="details_chair">
                        <li>Available</li>
                        <li>Booked</li>
                        <li>Selected</li>
                    </div>
                </div>
                <!-- back n forth button -->
                <button class="book_tic" id="book_ticket">
                    <i class="bi bi-arrow-left-short"></i>
                </button>
                <button class="book_tic" id="book_ticket">
                    <i class="bi bi-arrow-right-short"></i>
                </button> 
            </div>
        </div>
        <script src="js/booking.js"></script>
    </body>
</html>