fs <- list.files("./", pattern = ".Rmd$")
bookdown::render_book(fs[[1]], "all")
bookdown::render_book(fs[[2]], "all")