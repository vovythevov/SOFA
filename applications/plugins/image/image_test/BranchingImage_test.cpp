// #define BOOST_TEST_MODULE BranchingImage
 
#include <boost/test/unit_test.hpp>

#include "../BranchingImage.h"
#include <sofa/helper/RandomGenerator.h>


namespace fixture {

   using namespace cimg_library;


  template< class T >
  struct BranchingImageFixture {

      typedef sofa::defaulttype::Image<T> ImageTypes;
      typedef sofa::defaulttype::BranchingImage<T> BranchingImageTypes;

      sofa::helper::RandomGenerator randomGenerator;

      ImageTypes flatImage, flatImage2;
      BranchingImageTypes branchingImage, branchingImage2;

      BranchingImageFixture()
      {
          //// Prepare the flat image
          // set random dimensions
          typename ImageTypes::imCoord flatDim( unsigned(cimg::rand()*10+1), unsigned(cimg::rand()*10+1), unsigned(cimg::rand()*10+1), unsigned(cimg::rand()*4+1), unsigned(cimg::rand()*5+1) );

//          std::cerr<<flatDim<<std::endl;

          flatImage.setDimensions( flatDim );
          // initialize with random values
          cimglist_for(flatImage.getCImgList(),l)
                  cimg_forXYZC(flatImage.getCImg(l),x,y,z,c)
                  flatImage.getCImg(l)(x,y,z,c) = randomGenerator.random<T>( -1000, 1000 );

          // convert the flat image to a sparse branching image
          branchingImage = flatImage;

          // cloning
          branchingImage2 = branchingImage;

          branchingImage.toImage( flatImage2, 0 );
      }

      ~BranchingImageFixture()
      {
      }




      static bool dimensionsAreEqual( const typename ImageTypes::imCoord& flatDim, const typename BranchingImageTypes::Dimension& sparseDim )
      {
          return flatDim == sparseDim;
      }

  };

}


typedef fixture::BranchingImageFixture<bool> BranchingImageFixtureB;
BOOST_FIXTURE_TEST_SUITE( BranchingImageB, BranchingImageFixtureB );
#include "BranchingImage_test.inl"
BOOST_AUTO_TEST_SUITE_END()

typedef fixture::BranchingImageFixture<double> BranchingImageFixtureD;
BOOST_FIXTURE_TEST_SUITE( BranchingImageD, BranchingImageFixtureD );
#include "BranchingImage_test.inl"
BOOST_AUTO_TEST_SUITE_END()
