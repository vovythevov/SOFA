#include "DiagonalCompliance.h"
#include <iostream>
using std::cerr;
using std::endl;

namespace sofa
{
namespace component
{
namespace forcefield
{

template<class DataTypes>
DiagonalCompliance<DataTypes>::DiagonalCompliance( core::behavior::MechanicalState<DataTypes> *mm )
    : Inherit(mm)
    , diagonal( initData(&diagonal, 
                         "compliance", 
                         "Compliance value diagonally applied to all the DOF."))
{
	this->isCompliance.setValue(true);
}

template<class DataTypes>
void DiagonalCompliance<DataTypes>::init()
{
    Inherit::init();
    if( this->getMState()==NULL ) serr<<"DiagonalCompliance<DataTypes>::init(), no mstate !" << sendl;
    reinit();
}

template<class DataTypes>
void DiagonalCompliance<DataTypes>::reinit()
{
    core::behavior::BaseMechanicalState* state = this->getContext()->getMechanicalState();
    assert(state);

    matC.resize(state->getMatrixSize(), state->getMatrixSize());

    unsigned int m = state->getMatrixBlockSize(), n = state->getSize();

    unsigned int row = 0;
    for(unsigned i = 0; i < n; ++i)
    {
        for(unsigned int j = 0; j < m; ++j)
        {
//            matC.beginRow(row);
            matC.insertBack(row, row, diagonal.getValue()[i][j]);
//            matC.add(row, row, diagonal.getValue()[i][j]);
            ++row;
        }
    }
    matC.compress();
}

//template<class DataTypes>
//void DiagonalCompliance<DataTypes>::setCompliance( Real c )
//{
//    if(isCompliance.getValue() )
//        compliance.setValue(c);
//    else {
//        assert( c!= (Real)0 );
//        for(unsigned i=0; i<C.size(); i++ )
//            C[i][i] = 1/c;
//    }
//    compliance.setValue(C);
//}

template<class DataTypes>
const sofa::defaulttype::BaseMatrix* DiagonalCompliance<DataTypes>::getComplianceMatrix(const core::MechanicalParams*)
{
    return &matC;
}

template<class DataTypes>
void DiagonalCompliance<DataTypes>::addForce(const core::MechanicalParams *, DataVecDeriv& _f, const DataVecCoord& _x, const DataVecDeriv& _v)
{
    helper::ReadAccessor< DataVecCoord >  x(_x);
    helper::ReadAccessor< DataVecDeriv >  v(_v);
    helper::WriteAccessor< DataVecDeriv > f(_f);

    for(unsigned i=0; i<f.size(); i++)
    {
        f[i] += x[i].linearDivision( -diagonal.getValue()[i] );
    }

}


}
}
}
