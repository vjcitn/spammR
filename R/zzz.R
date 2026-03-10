#' Loads python code
#' @description `.onLoad()` is called when loading package.
#' @import reticulate
#' @param libname name of library
#' @param pkgname Name of package
#' @noRd
.onLoad <- function(libname, pkgname){
  reticulate::py_require(python_version = "3.11")
  
  if (!reticulate::py_module_available('pandas'))
    reticulate::py_install('pandas')
  if (!reticulate::py_module_available('numpy'))
    reticulate::py_install('numpy')
  # import name for `metaspace` is different from the pypi package name
  if (!reticulate::py_module_available('metaspace'))
    reticulate::py_install('metaspace2020')
  
}