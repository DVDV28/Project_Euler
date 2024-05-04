#' Question Importer
#' 
#' Creates a new file within the project as the starting point for working on it
#' @param q_no The question number
#' @param extension The extension for the new script created (e.g. R or py)
import_question <- function(q_no, extension = "R"){
    ## Import
    url <- paste0("https://projecteuler.net/problem=", q_no) ## Doesn't use the minimal version because I want the title
    question <- readLines(url)
    
    ## Body of question starts when it starts using the h2 level heading
    question <- question[which(grepl("<h2>", question)):which(grepl("end_content", question))]
    
    ## Extract title from first entry
    question[1] <- gsub("(<h2>)(.*)(</h2>.*)", "\\2", question[1], perl = T)
    
    ## Add URL to first row
    question <- c(url, question)
    
    ## Remove HTML tags
    question <- gsub("<.*?>", "", question)
    
    ## Remove blank lines
    question <- question[question != "" & gsub(" ", "", question) != ""]
    
    ## Convert to comments
    question <- paste("##", question)
    
    ## Remove dollar signs. They're just LATEX
    question <- gsub("\\$", "", question)
    
    ## Save
    save_loc <- file.path(getwd(), "R", "Solution Scripts",
                          paste0(sprintf("%03d", q_no), ".", extension)) 
    
    if (file.exists(save_loc)) {
        stop(paste("File already exists at", save_loc))
    }
    
    writeLines(question, save_loc)
    
    file.edit(save_loc)
    
    return(invisible(question))
}