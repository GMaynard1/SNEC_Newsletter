## Call the necessary packages
library(blastula)
library(keyring)
## Enter email credentials if you haven't already
# blastula::create_smtp_creds_key(
#   id="snec_gmail",
#   user="snec.newsletter@gmail.com",
#   provider="gmail"
# )
## Prep the newsletter message from the markdown file
newsletter=blastula::render_email(
  input=file.choose()
)
## Test
blastula::smtp_send(
  email=newsletter,
  to=c("george.maynard@noaa.gov","andrew.bade@ct.gov","christopher.mcdowell@ct.gov"),
  from="snec.newsletter@gmail.com",
  subject="TEST Newsletter",
  credentials=creds_key(id = "snec_gmail")
)
## Production
blastula::smtp_send(
  email=newsletter,
  to="AFS_SNEC-L@LISTSERV.UCONN.EDU",
  from="snec.newsletter@gmail.com",
  subject="SNEC Newsletter",
  credentials=creds_key(id = "snec_gmail")
)
