cmake_minimum_required(VERSION 2.8)

project("SofaConstraint")

include(${SOFA_CMAKE_DIR}/preProject.cmake)

set(HEADER_FILES

    initConstraint.h 
    collision/LocalMinDistance.h 
    collision/LocalMinDistance.inl 
    collision/LMDNewProximityIntersection.h 
    collision/LMDNewProximityIntersection.inl 
    collision/FrictionContact.h 
    collision/FrictionContact.inl 
    collision/StickContactConstraint.h 
    collision/StickContactConstraint.inl 
    constraintset/UnilateralInteractionConstraint.h 
    constraintset/UnilateralInteractionConstraint.inl 
    constraintset/UncoupledConstraintCorrection.h 
    constraintset/UncoupledConstraintCorrection.inl 
    constraintset/PrecomputedConstraintCorrection.h 
    constraintset/PrecomputedConstraintCorrection.inl 
    constraintset/LinearSolverConstraintCorrection.h 
    constraintset/LinearSolverConstraintCorrection.inl 
    constraintset/LCPConstraintSolver.h 
    constraintset/ConstraintSolverImpl.h 
    animationloop/FreeMotionAnimationLoop.h 
    constraintset/ContactDescription.h 
    constraintset/GenericConstraintSolver.h 
    constraintset/BilateralInteractionConstraint.h 
    constraintset/BilateralInteractionConstraint.inl 
    animationloop/ConstraintAnimationLoop.h 
    constraintset/StopperConstraint.h 
    constraintset/StopperConstraint.inl 
    constraintset/SlidingConstraint.h 
    constraintset/SlidingConstraint.inl 
    collision/ConstraintAttachBodyPerformer.h 
    collision/ConstraintAttachBodyPerformer.inl

    )
    
set(SOURCE_FILES

    initConstraint.cpp 
    collision/LocalMinDistance.cpp 
    collision/LMDNewProximityIntersection.cpp 
    collision/FrictionContact.cpp 
    collision/StickContactConstraint.cpp 
    constraintset/UnilateralInteractionConstraint.cpp 
    constraintset/UncoupledConstraintCorrection.cpp 
    constraintset/PrecomputedConstraintCorrection.cpp 
    constraintset/LinearSolverConstraintCorrection.cpp 
    constraintset/LCPConstraintSolver.cpp 
    constraintset/ConstraintSolverImpl.cpp 
    animationloop/FreeMotionAnimationLoop.cpp 
    constraintset/GenericConstraintSolver.cpp 
    constraintset/BilateralInteractionConstraint.cpp 
    animationloop/ConstraintAnimationLoop.cpp 
    constraintset/StopperConstraint.cpp 
    constraintset/SlidingConstraint.cpp 
    collision/ConstraintAttachBodyPerformer.cpp

    )
    
if( EXTERNAL_HAVE_EIGEN2 )
	list(APPEND HEADER_FILES "collision/BarycentricDistanceLMConstraintContact.h")
	list(APPEND HEADER_FILES "collision/BarycentricDistanceLMConstraintContact.inl")
	list(APPEND HEADER_FILES "constraintset/DOFBlockerLMConstraint.h")
	list(APPEND HEADER_FILES "constraintset/DOFBlockerLMConstraint.inl")
	list(APPEND HEADER_FILES "constraintset/FixedLMConstraint.h")
	list(APPEND HEADER_FILES "constraintset/FixedLMConstraint.inl")
	list(APPEND HEADER_FILES "constraintset/DistanceLMContactConstraint.h")
	list(APPEND HEADER_FILES "constraintset/DistanceLMContactConstraint.inl")
	list(APPEND HEADER_FILES "constraintset/DistanceLMConstraint.h")
	list(APPEND HEADER_FILES "constraintset/DistanceLMConstraint.inl")
	list(APPEND HEADER_FILES "constraintset/LMConstraintSolver.h")
	list(APPEND HEADER_FILES "constraintset/LMConstraintDirectSolver.h")

	list(APPEND SOURCE_FILES "collision/BarycentricDistanceLMConstraintContact.cpp")
	list(APPEND SOURCE_FILES "constraintset/DOFBlockerLMConstraint.cpp")
	list(APPEND SOURCE_FILES "constraintset/FixedLMConstraint.cpp")
	list(APPEND SOURCE_FILES "constraintset/DistanceLMContactConstraint.cpp")
	list(APPEND SOURCE_FILES "constraintset/DistanceLMConstraint.cpp")
	list(APPEND SOURCE_FILES "constraintset/LMConstraintSolver.cpp")
	list(APPEND SOURCE_FILES "constraintset/LMConstraintDirectSolver.cpp")


endif()   

add_library(${PROJECT_NAME} SHARED ${HEADER_FILES} ${SOURCE_FILES})

set(COMPILER_DEFINES "SOFA_BUILD_CONSTRAINT" )
set(LINKER_DEPENDENCIES SofaMeshCollision SofaSimpleFem SofaImplicitOdeSolver SofaEigen2Solver SofaUserInteraction )
        
include(${SOFA_CMAKE_DIR}/postProject.cmake)
