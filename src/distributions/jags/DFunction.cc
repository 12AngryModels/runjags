/*

	This file is Copyright (C) 2002-10 Martyn Plummer, 
	from the source for JAGS version 3.3, licensed under GPL-2
	
	The only modification is the change in namespace to prevent clashes

*/

#include "RScalarDist.h"
#include "DFunction.h"

using std::vector;
using std::string;

namespace runjags {

    DFunction::DFunction(RScalarDist const *dist)
	: DPQFunction(dist->name(), dist)
    {}
    
    double DFunction::evaluate(vector<double const *> const &args) const
    {
	double x = *args[0];
	vector<double const *> param(args.size() - 1);
	for (unsigned int i = 1; i < args.size(); ++i) {
	    param[i-1] = args[i];
	}
	
	return dist()->d(x, PDF_FULL, param, false);
    }

    bool 
    DFunction::checkParameterValue(vector<double const *> const &args) const
    {
	if (dist()->discrete()) {
	    double x = *args[0];
	    if (x != static_cast<int>(x))
		return false;
	}
	
	return checkArgs(args);
    }
}