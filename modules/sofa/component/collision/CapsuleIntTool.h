#ifndef CAPSULEINTTOOL_H
#define CAPSULEINTTOOL_H
#include <sofa/core/collision/Intersection.h>
#include <sofa/helper/FnDispatcher.h>
#include <sofa/component/collision/CapsuleModel.h>
#include <sofa/component/collision/SphereModel.h>
#include <cmath>

namespace sofa
{
namespace component
{
namespace collision
{
class CapsuleIntTool{
public:
    typedef sofa::helper::vector<sofa::core::collision::DetectionOutput> OutputVector;

    static bool computeIntersection(Capsule&, Capsule&,double alarmDist,double contactDist,OutputVector* contacts);
    static bool computeIntersection(Capsule&, Sphere&,double alarmDist,double contactDist,OutputVector* contacts);
};

}
}
}
#endif // CAPSULEINTTOOL_H