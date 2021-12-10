## Call the necessary packages
library(blastula)
library(keyring)
## Enter email credentials if you haven't already
blastula::create_smtp_creds_key(
  id="snec_gmail",
  user="snec.newsletter@gmail.com",
  provider="gmail"
)
## Prep the newsletter message from the markdown file
newsletter=blastula::render_email(
  input=file.choose()
)
blastula::smtp_send(
  email=newsletter,
  to="george.maynard@noaa.gov",
  from="snec.newsletter@gmail.com",
  subject="Newsletter Test",
  credentials=creds_key(id = "snec_gmail")
)
