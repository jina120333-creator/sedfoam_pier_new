/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2212                                  |
|   \\  /    A nd           | Website:  www.openfoam.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    arch        "LSB;label=64;scalar=64";
    class       volVectorField;
    location    "0";
    object      U.b;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 1 -1 0 0 0 0];

internalField   uniform (0 0 0);

boundaryField
{
    inletWaterLower
     {
         type            uniformFixedValue;
         uniformValue    table
         (
             (0.0   (0      0 0))
            (0.1   (0.012  0 0))
             (3.0   (0.025  0 0))
             (5.0   (0.04   0 0))
            (10.0  (0.06   0 0))
         );
     }
     inletWaterUpper
     {
        type            uniformFixedValue;
        uniformValue    table
        (
             (0.0   (0      0 0))
             (0.1   (0.05   0 0))
             (3.0   (0.10   0 0))
             (5.0   (0.15   0 0))
             (10.0  (0.233  0 0))
          );
        }
 
    inletSediment
    {
        type            fixedValue;
        value           uniform (0 0 0);
    }
    outletWater
    {
        type            zeroGradient;
    }
    outletSediment
    {
        type            zeroGradient;
    }
    "(sideWalls|bottom|pier)"
    {
        type            noSlip;
    }
    top
    {
        type            pressureInletOutletVelocity;
        value           uniform (0 0 0);
    }
}


// ************************************************************************* //
