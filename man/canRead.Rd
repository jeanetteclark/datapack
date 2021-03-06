% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataObject.R
\docType{methods}
\name{canRead}
\alias{canRead}
\alias{canRead,DataObject-method}
\title{Test whether the provided subject can read an object.}
\usage{
canRead(x, ...)

\S4method{canRead}{DataObject}(x, subject)
}
\arguments{
\item{x}{DataObject}

\item{...}{Additional arguments}

\item{subject}{: the subject name of the person/system to check for read permissions}
}
\value{
boolean TRUE if the subject has read permission, or FALSE otherwise
}
\description{
Using the AccessPolicy, tests whether the subject has read permission
for the object.  This method is meant work prior to submission to a repository, 
and will show the permissions that would be enforced by the repository on submission.
Currently it only uses the AccessPolicy to determine who can read (and not the rightsHolder field,
which always can read an object).  If an object has been granted read access by the
special "public" subject, then all subjects have read access.
}
\details{
The subject name used in both the AccessPolicy and in the \code{'subject'}
argument to this method is a string value, but is generally formatted as an X.509
name formatted according to RFC 2253.
}
\examples{
data <- charToRaw("1,2,3\\n4,5,6\\n")
obj <- new("DataObject", id="1234", dataobj=data, format="text/csv")
obj <- addAccessRule(obj, "smith", "read")
access <- canRead(obj, "smith")
}
\seealso{
\code{\link{DataObject-class}}
}
