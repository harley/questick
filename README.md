## Questionery

### A simple survey app for you to embed on yoursite.

### What it does
- User can create a survey
- User gets a survey link to embed in their site and sets a password
- People can respond to the survey after visiting the survey link
- User can download survey results with the right password.

### Quick technical notes
- User goes to `surveys/new`, fills out set, sets a password and click `Save` to get survey `xyz123`
- User is redirected to `results/xyz123?` which requires the above password. User can download data as CSV
- User gets `s/xyz123` to embed as an iframe. Can also view it directly

