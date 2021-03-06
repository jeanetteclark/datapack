% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataPackage.R
\docType{methods}
\name{getMember}
\alias{getMember}
\alias{getMember,DataPackage-method}
\title{Return the Package Member by Identifier}
\usage{
getMember(x, ...)

\S4method{getMember}{DataPackage}(x, identifier)
}
\arguments{
\item{x}{A DataPackage instance}

\item{...}{(Not yet used)}

\item{identifier}{A DataObject identifier}
}
\value{
A DataObject if the member is found, or NULL if not
}
\description{
Given the identifier of a member of the data package, return the DataObject
representation of the member.
}
\examples{
dp <- new("DataPackage")
data <- charToRaw("1,2,3\\n4,5,6")
do <- new("DataObject", id="myNewId", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
do2 <- getMember(dp, "myNewId")
}
\seealso{
\code{\link{DataPackage-class}}
}
