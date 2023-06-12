setwd("C:/Users/John/Desktop/triggerise")
#necessary libraries
library(blastula)
library(quanteda)
library(quarto)
library(DataExplorer)
#data with necessary information for clients
#example
clients=data.frame(
  Name=c('Client A','Client B','Client C'),
  Email=c('clienta@example.com',
          'clientb@example.com',
          'clientc@example.com')
  #I can add other variables here
)

#generate individual reports
#either by quanteda or quato
#example
generate_report=function(client_name){
  report=paste("Dear",client_name,
               ",\n\nHere is you weekly report")
  return(report)
}

#create list to store the reports for each client
#I have used such a function in python
reports =lapply(clients$Name,generate_report)

#send emails with attached reports using blastula
#set up email settings
smtp_out=smtp_server(
  server="smtp.example.com",
  port=587,
  username="your_username",
  password="your_password",
  use_ssl=TRUE
)

#loop through the client data and send emails
for (i in 1:nrow(clients)) {
  email=compose_email(
    body = reports[[i]],
    subject="Weekly Report",
    from="you_email@example.com",
    to=clients$Email[i],
    encoding="UTF-8"
  )
  
  email=smtp_send(
    email,
    sender=smtp_out$sender(),
    authenticate=stmp_out$authentication(),
    host=smtp_out$host(),
    port=smtp_out$port(),
    credentials=creds_userpass(smtp_out$username(),
                               smtp_out$password())
  )
  
  print(paste("Email sent to",clients$Name[i]))
}


#code 2 b
#create a list of clients and their adresses
clients=list(
  client1="kilemimugambi@gmail.com",
  client2="fmusee390@gmail.com"
)

#function to generate a report for a specific
#client
generate_report2=function(client){
  
}

#I will come back to b
#create_smtp_creds_file(file = "murume",
#                       user="murume2195@outlook.com",
#                       provider = "outlook")

#generate the email object using blastula
my_email_object=render_email("blastula_email.qmd")

#sending the email
smtp_send(my_email_object,
          from="murume2195@outlook.com",
          to="kilemimugambi@gmail.com",
          subject="My first email from blastula!",
          credentials = creds_file("murume"))










