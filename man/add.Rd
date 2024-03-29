% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic_list.R, R/compartments.R,
%   R/parameters.R, R/code_record.R, R/code_records.R, R/campsis_model.R
\name{add}
\alias{add}
\alias{add,pmx_list,pmx_element-method}
\alias{add,pmx_list,pmx_list-method}
\alias{add,pmx_list,list-method}
\alias{add,compartments,compartment_property-method}
\alias{add,compartments,compartments-method}
\alias{add,parameters,single_array_parameter-method}
\alias{add,parameters,double_array_parameter-method}
\alias{add,parameters,parameters-method}
\alias{add,code_record,model_statement-method}
\alias{add,code_record,code_record-method}
\alias{add,code_records,code_records-method}
\alias{add,code_records,model_statement-method}
\alias{add,campsis_model,compartment_property-method}
\alias{add,campsis_model,parameter-method}
\alias{add,campsis_model,code_record-method}
\alias{add,campsis_model,model_statement-method}
\alias{add,campsis_model,campsis_model-method}
\title{Add element to list.}
\usage{
add(object, x, ...)

\S4method{add}{pmx_list,pmx_element}(object, x, pos = NULL)

\S4method{add}{pmx_list,pmx_list}(object, x)

\S4method{add}{pmx_list,list}(object, x)

\S4method{add}{compartments,compartment_property}(object, x)

\S4method{add}{compartments,compartments}(object, x)

\S4method{add}{parameters,single_array_parameter}(object, x)

\S4method{add}{parameters,double_array_parameter}(object, x)

\S4method{add}{parameters,parameters}(object, x)

\S4method{add}{code_record,model_statement}(object, x, pos = NULL)

\S4method{add}{code_record,code_record}(object, x)

\S4method{add}{code_records,code_records}(object, x)

\S4method{add}{code_records,model_statement}(object, x, pos = NULL)

\S4method{add}{campsis_model,compartment_property}(object, x)

\S4method{add}{campsis_model,parameter}(object, x)

\S4method{add}{campsis_model,code_record}(object, x)

\S4method{add}{campsis_model,model_statement}(object, x, pos = NULL)

\S4method{add}{campsis_model,campsis_model}(object, x)
}
\arguments{
\item{object}{list object}

\item{x}{element to add}

\item{...}{extra arguments, unused by this generic list}

\item{pos}{position where x needs to be added in list}
}
\value{
modified list object
}
\description{
Add element to list.
}
