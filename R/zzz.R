globalVariables(".")

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    pkgname, " ", getNamespaceVersion(pkgname), "\n",
    "   Perform IMAP queries via curl\n",
    "   Issues, notes and quick start: https://github.com/crazycapivara/iampr/"
  )
}
