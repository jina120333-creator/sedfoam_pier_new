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
    inletWater
    {
        //type            fixedValue;
        //value           uniform (0.1 0 0);
        type            uniformFixedValue;
        uniformValue    table
        (
             (0.0     (0      0 0))
             (0.5     (0.025 0 0))
             (1.0     (0.05  0 0))
             (100     (0.1  0 0))
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
