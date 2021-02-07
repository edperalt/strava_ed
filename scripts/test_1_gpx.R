

file <- ""


pfile <- XML::htmlTreeParse(file = file,
                            error = function (...) {},
                            useInternalNodes = TRUE)

coords <- XML::xpathSApply(pfile, path = "//trkpt", XML::xmlAttrs)
