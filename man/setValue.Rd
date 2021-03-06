% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataPackage.R
\docType{methods}
\name{setValue}
\alias{setValue}
\alias{setValue,DataPackage-method}
\title{Set values for selected DataPackage members.}
\usage{
setValue(x, ...)

\S4method{setValue}{DataPackage}(x, name, value,
  identifiers = NA_character_, ...)
}
\arguments{
\item{x}{A DataPackage instance}

\item{...}{(Not yet used)}

\item{name}{A DataObject slot name.}

\item{value}{A new value to assign to the slot for selected DataPackage members.}

\item{identifiers}{A list of identifiers of DataPackage members to update.}
}
\value{
A DataPackage with possibly updated DataObjects.
}
\description{
The \code{'setValue'} method is used to modify values stored in DataPackage members.
Each member in a DataPackage is a DataObject which is an R S4 object that contains a set of values (slots).
The available slots are described at \code{help("DataObject-class")}.
}
\details{
If the parameter \code{identifiers} is provided, then DataPackage members that
have identifiers specified in the list will be updated. If this parameter is not provided
then no members will be updated. To update all members in a package, specify the
value of \code{identifiers=getIdentifiers(pkg)} where \code{pkg} is the variable name
of the DataPackage to update. Note that this method can be used to update the
\code{data} or \code{filenane} slots, but it is instead recommended to us the
\code{replaceMember} method to achieve this, as the \code{replaceMember} method assists 
in properly setting the related SystemMetadata values.
}
\examples{
# First create a package that we can modify. 
dp <- new("DataPackage")
data <- charToRaw("1,2,3\\n4,5,6")
# The next statment sets the format type incorrectly as an example, so we can correct it later
do <- new("DataObject", id="myNewId", dataobj=data, format="image/jpg", user="jsmith")
dp <- addMember(dp, do)
data <- charToRaw("7,8.9\\n4,10,11")
# This next statement also sets the format type incorrectly
do <- new("DataObject", id="myNewId2", dataobj=data, format="image/jpg", user="jsmith")
dp <- addMember(dp, do)
# Change format types to correct value for both package members
# Careful! Specifying 'identifiers=getIdentifiers(dp) will update all package members!
dp <- setValue(dp, name="sysmeta@formatId", value="text/csv", identifiers=getIdentifiers(dp))
}
\seealso{
\code{\link{DataPackage-class}}
}
