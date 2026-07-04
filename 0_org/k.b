/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  v2312                                 |
|   \\  /    A nd           | Website:  www.openfoam.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       volScalarField;
    object      k;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 4.14e-03; //$turbulentKE;

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           $internalField;
    }
    inletSediment
    {
        type            fixedValue;
        value           $internalField;
    }

    outletWater
    {
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
    }
    outletSediment
    {
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
    }
    top
    {
        type            inletOutlet;
        inletValue      $internalField;
        value           $internalField;
    }
    "(sideWalls|bottom|pier)"
    {
        type            kqRWallFunction;
        value           $internalField;
    }

}


// ************************************************************************* //
