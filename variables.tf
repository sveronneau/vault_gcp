variable "credentials" {
  default = "{
  "type": "service_account",
  "project_id": "tj4h-shared",
  "private_key_id": "06b12880f243516df12621eb8eb0533c9559ea69",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDF63VaTKsqqHF4\n3e20G7oLGaUZ9AVgBAn8WZVpEY78gv3q5UlIw3j1Zojg498Dekvak3uTY/q7WrDM\nFVVOvWHWzBqRTz5ezOFl4Py1Rufn77aBmzM5V1J6CThWdwQ2aTf1o8/Pt12/CsYs\nRSXG256Zkq5ZC7RaZUnunpp1PiL+A8qWeBitYZVDGPqbpU9AJcanvrKQVui2bc/+\ncR2D0T/2404ij+190P19gbYqmEFHtM2dmq1C2mOkFtJNF2pwA62QFTbTtndyDr37\nw3OKI23dfd5yNU6ADSnSYaa8DfP8v65G/r87dMWmXFRyR+/+ybE+BfjSr+eMDM1Y\nIJBNEgU3AgMBAAECggEAD6roC1Huat4SvYK0AoH/ZEmPbFKI6mTndXaSAVNGgm7M\nMwAboQr4VFTdmQ/w45GW16K9MZnEi3hObplxu136lMprf/1J7q9BWJNK7f7C9PVg\n+TmUAIINIWQBdbbOOpBxwZxKIyNc5Hax4WdH6koQcA/QhXQLvuwtwhoEGCvnETyP\n9XVN7/rnTxpMnYxxTa4qLTiavGbtJkl1dE5l2QhFSZILDCfAXqXcL09Fz00FOdpJ\n61kfT1+q+ZL81PtEA+bIgEzE6MZcXA7Oi1RrDByWbwuqkss9kdqYpJWfcUkKT5Sg\nVEkifXWajv3t+qUMnbt8lJQ1KuaIspHee73hdaL6gQKBgQDij8L1IMi3DYUo9PnL\nlWvAmHKl2BTiJ6kx762GJ7/TlzD/ZG0waki7UNU2MviI5rPqDHVcQO1zumocOqGD\niv2BYkrO86T3dnJnlYFdgWmAlnhCLUCllsJy08SPG1dW82UQj0iEotZos4jcoDmy\nYAxmp/OoHUkzJu2AC06d/c3mcQKBgQDfovgUfCxYSaFztNQ7H8xjDixGG3UR8h49\nc9RDG2u1UCL68hsD0RpgUNIk2UkLh+k2+jLN7HYyXjqB9zetsijkLlHx9s2LtMr8\n4avDgPKlcyGO7HDLAPgWXm2F0aOvXLM+VroKHEP2esu47VeBLwSg1mDJJ02oTOpa\nP2Fhp6uKJwKBgH6j700H80nnI8y+CrcSobV5QXSUcS/tDXVdTPiVVXOXqorHfwU2\nE8uoplVyblxP4LduGVfk7xXmWJPI7ilSUtu0rq45oLe2nMJr3nD++pMnCLetBdrJ\nh42Z8+AuX0a6LH7yKI4DW6gQ2urAISAk8imbreYF4LnYA5+0MlC74xDxAoGAPpw1\nsCaDk8Qpe2do85SXeDQDmS0evYN3i+TdzFvk78IbyP33Kj5kkAqQith6ZswKMuYh\nSx2kib1vy+sWn359jESblI5wRWi8W8gien2jcUamYok3mt4OltSg/RIQLYxacl19\ngE8hh+QhHQj1sqkjNpROTILAbxn5koKkFN8IW4kCgYANEPbepiIFFyTAAvIkRUTY\nPLZ8KphshwdZSZDoaoc5PzdtoeAl8THSSgAhlbOaVuRYqMJyoBQtFDsruS3OW9mk\nQMl535nR+D0PvKhZadod5rgDdteg2MvHrFO5W01aYimgMdKjWj5LeFmXJ6hXYXoO\nE41mIGFNbW2xF6Wmb+Pk2Q==\n-----END PRIVATE KEY-----\n",
  "client_email": "vault-gcp@tj4h-shared.iam.gserviceaccount.com",
  "client_id": "111344555014926271136",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/vault-gcp%40tj4h-shared.iam.gserviceaccount.com"
}
" 
}

variable "project" {
  default = "your_project_id" 
}

variable "region" {
  default = "northamerica-northeast1" 
}

variable "zone" {
  default = "northamerica-northeast1-a" 
}
