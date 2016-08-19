library(rsconnect)
library(shiny)

rsconnect::setAccountInfo(name='peetpass', token='24417CD3FA809B83AB17BD32C23EE26A', secret='S5mbbRFSRagDwJGwO36Wqje0fmcw5TTb6QvYH27E')
deployApp() # This will upload files to rsconnect.
deployApp(account='peetpass')
#deployApp(account='wreckord')

accounts(server = NULL)

runApp()

