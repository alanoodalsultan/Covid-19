# final-project

# description:
## covid-19 App is an application that enable users to show all world countries covid cases, show the nearst hospital that can gives covid vaccinations and users can make reservation appointment for vaccination.


# user stories: 
.1 As a user I can create account, so that I can use the application
.2 As a user I can login, so that I can use the application 
.3 As a user I can show all covid cases, so that I can follow the covid update.
.4 As a user I can read and search in news page, so I can read more information about covid news
.5 As a user I can use appointment reservation page, so that I book a vaccination appointment
.6 As a user I can see my appointment in the reservation page 
.7 As a user I can change application language in setting page, so that I can use it in both Arabic and English languages
.8 As a user I can add, comment, suggestion or complaint about the service that I have take 

# user profile:
1- see my profile 
2- change my status 
3- change my profile image 
4- sign out from app



| # component  | # Permissions            | # Behavior.   |
| :---         |     :---:                |          ---: |
| signup  page | anon only <AnonRoute>    | Signup from , link to login, navigate to homepage after signup   |
| LoginPage    | anon only <AnonRoute>    | Login form, link to signup, navigate to homepage after login     |
| covidPage    | user only <PrivateRoute> | show all countries covid cases                                   |
| news Page    | user only <PrivateRoute> | read and search in news page                                     |
| settingsPage | user only <PrivateRoute> |  can book my appointment , change the language , add comment.    |
| profilepage  | user only <PrivateRoute> | set profile status and image and signout                          |
  
  
# Components 
  . login page
  . sign up page
  . covid page 
  . news page 
  . settings page 
  . profile page 
  
  
  # Services
  
## 1. Auth Service
   . auth.login(user)
   . auth.signup(user)
   . auth.signout()
  
  
 ## 2. settings service
     . book an appointment 
     . change the language
     . add a comment, suggestion or complaint
  
  ## 3. profile service
     . change the image 
     . change the status 
     . sign out
 
  presentation link : https://docs.google.com/presentation/d/1yUXEzYBGPUTG0LoW1iYilCtopxg-CaiS/edit#slide=id.p13
  

