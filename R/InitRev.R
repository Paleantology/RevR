
#'Create an environment for interacting with RevBayes
#'
#'Creates an environment for interecting with rb.exe. This environment contains the variable
#'    RevPath for storing the path to rb.exe. If no path is provided, it will default to trying
#'    to use a path stored in Revticulate/RevPath.txt in .libPaths(). This means the user only has
#'    to provide the path to rb.exe once, and can change the path at any time by applying it again
#'    in initRev().
#'
#'@param path String path to rb.exe
#'
#'@param useHistory boolean Should the code from the previous Revticulate session be written into
#'                  revEnv$allCode? Default is FALSE.
#'
#'@examples
#' \dontrun{
#'RevPath <- "C://Users/Caleb/Documents/WrightLab/RevBayes_Win_v1.0.13/RevBayes_Win_v1.0.13/rb.exe"
#'initRev(RevPath)
#'}
#'@export
initRev <- function(path = NULL, useHistory = FALSE){
  revEnv <<- new.env(parent = globalenv())

  if(!is.null(path)){
    revEnv$RevPath <- path
    write(path, list.files(.libPaths(), "Revticulate", full.names = TRUE) %+% "/RevPath.txt")
  }
  else{
    revEnv$RevPath <-  readLines(list.files(.libPaths(), "Revticulate", full.names = TRUE) %+% "/RevPath.txt")
  }

  revEnv$vars <- c()
  revEnv$temps <- c()
  revEnv$revHistory <- list.files(.libPaths(), "Revticulate", full.names = TRUE) %+% "/Revhistory.Rhistory"
  cat("", file = revEnv$revHistory , append = useHistory)
  revEnv$allCode <- readLines(revEnv$revHistory)
}
