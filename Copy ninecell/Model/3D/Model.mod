'# MWS Version: Version 2015.6 - Oct 30 2015 - ACIS 24.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.0 fmax = 4
'# created = '[VERSION]2015.6|24.0.2|20151030[/VERSION]


'@ use template: Waveguide & Cavity Filter

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
' History:
' jei, vso 18-Jan-2012: ver1
' boundaries
With Boundary
     .Xmin "electric"
     .Xmax "electric"
     .Ymin "electric"
     .Ymax "electric"
     .Zmin "electric"
     .Zmax "electric"
End With
With Mesh
     .MeshType "PBA"
     .SetCreator "High Frequency"
     .AutomeshRefineAtPecLines "True", "2"
     .UseRatioLimit "True"
     .RatioLimit "10"
     .LinesPerWavelength "20"
     .MinimumStepNumber "10"
     .Automesh "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "StepsPerWaveNear", "13"
End With
' solver - FD settings
With FDSolver
     .Reset
     .Method "Tetrahedral Mesh" ' i.e. general purpose
     .AccuracyHex "1e-6"
     .AccuracyTet "1e-5"
     .AccuracySrf "1e-3"
     .SetUseFastResonantForSweepTet "False"
     .Type "Direct"
     .MeshAdaptionHex "False"
     .MeshAdaptionTet "True"
     .InterpolationSamples "5001"
End With
With MeshAdaption3D
    .SetType "HighFrequencyTet"
    .SetAdaptionStrategy "Energy"
    .MinPasses "3"
    .MaxPasses "20"
    .MaxDeltaS "0.005"
End With
With FDSolver
     .Method "Tetrahedral Mesh (MOR)"
     .HexMORSettings "", "5001"
End With
FDSolver.Method "Tetrahedral Mesh" ' i.e. general purpose
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "Tetrahedral"
End With
'set the solver type
ChangeSolverType("HF Eigenmode")

'@ import sat/sab file: C:\Users\ethoeng\Desktop\CST Files\triumf9cell.sat

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With SAT
     .Reset 
     .FileName "*triumf9cell.sat" 
     .Id "1" 
     .Version "9.0" 
     .ScaleToUnit "0" 
     .ImportToActiveCoordinateSystem "True" 
     .Curves "True" 
     .Read 
End With

'@ define boundaries

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
     .Xsymmetry "magnetic" 
     .Ysymmetry "magnetic" 
     .Zsymmetry "electric" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "adiabatic" 
     .YsymmetryThermal "adiabatic" 
     .ZsymmetryThermal "adiabatic" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ define frequency range

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Solver.FrequencyRange "0.0", "3.5"

'@ define eigenmode solver parameters

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Mesh.SetCreator "High Frequency" 
EigenmodeSolver.Reset 
With Solver
     .CalculationType "Eigenmode" 
     .AKSReset 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
End With
With EigenmodeSolver 
     .SetMethod "AKS" 
     .SetMeshType "Tetrahedral Mesh" 
     .SetMeshAdaptationHex "False" 
     .SetMeshAdaptationTet "True" 
     .SetNumberOfModes "1" 
     .SetStoreResultsInCache "False" 
     .SetCalculateExternalQFactor "False" 
     .SetConsiderStaticModes "True" 
     .SetCalculateThermalLosses "True" 
     .SetModesInFrequencyRange "False" 
     .SetFrequencyTarget "True", "0.0" 
     .SetAccuracy "1e-6" 
     .SetQExternalAccuracy "1e-4" 
     .SetMaterialEvaluationFrequency "True", "" 
     .SetTDCompatibleMaterials "False" 
     .SetOrderTet "2" 
     .SetUseSensitivityAnalysis "False" 
     .SetConsiderLossesInPostprocessingOnly "True" 
     .SetUseParallelization "True"
     .SetMaxNumberOfThreads "48"
     .SetRemoteCalculation "False"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"

'@ define frequency range

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Solver.FrequencyRange "0.0", "3.5"

'@ define eigenmode solver parameters

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Mesh.SetCreator "High Frequency" 
EigenmodeSolver.Reset 
With Solver
     .CalculationType "Eigenmode" 
     .AKSReset 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
End With
With EigenmodeSolver 
     .SetMethod "AKS" 
     .SetMeshType "Tetrahedral Mesh" 
     .SetMeshAdaptationHex "False" 
     .SetMeshAdaptationTet "True" 
     .SetNumberOfModes "10" 
     .SetStoreResultsInCache "False" 
     .SetCalculateExternalQFactor "False" 
     .SetConsiderStaticModes "True" 
     .SetCalculateThermalLosses "True" 
     .SetModesInFrequencyRange "False" 
     .SetFrequencyTarget "True", "0.0" 
     .SetAccuracy "1e-6" 
     .SetQExternalAccuracy "1e-4" 
     .SetMaterialEvaluationFrequency "True", "" 
     .SetTDCompatibleMaterials "False" 
     .SetOrderTet "2" 
     .SetUseSensitivityAnalysis "False" 
     .SetConsiderLossesInPostprocessingOnly "True" 
     .SetUseParallelization "True"
     .SetMaxNumberOfThreads "48"
     .SetRemoteCalculation "False"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"

'@ define boundaries

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
     .Xsymmetry "magnetic" 
     .Ysymmetry "magnetic" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "adiabatic" 
     .YsymmetryThermal "adiabatic" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ define frequency range

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Solver.FrequencyRange "0.0", "4"

'@ delete shape: component1:solid2

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Solid.Delete "component1:solid2"

'@ boolean add shapes: component1:pipe1, component1:pipe_tuner

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Solid.Add "component1:pipe1", "component1:pipe_tuner"

'@ change solver type

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
ChangeSolverType "HF Eigenmode"

'@ pick face

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Pick.PickFaceFromId "component1:pipe1", "33"

'@ define port: 1

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "103.3", "103.3" 
     .Yrange "-31", "31" 
     .Zrange "558.6", "620.6" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ pick face

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Pick.PickFaceFromId "port1", "1"

'@ delete port: port1

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Port.Delete "1"

'@ define eigenmode solver parameters

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Mesh.SetCreator "High Frequency" 
EigenmodeSolver.Reset 
With Solver
     .CalculationType "Eigenmode" 
     .AKSReset 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
End With
With EigenmodeSolver 
     .SetMethod "AKS" 
     .SetMeshType "Tetrahedral Mesh" 
     .SetMeshAdaptationHex "False" 
     .SetMeshAdaptationTet "True" 
     .SetNumberOfModes "10" 
     .SetStoreResultsInCache "True" 
     .SetCalculateExternalQFactor "False" 
     .SetConsiderStaticModes "True" 
     .SetCalculateThermalLosses "True" 
     .SetModesInFrequencyRange "False" 
     .SetFrequencyTarget "True", "1" 
     .SetAccuracy "1e-6" 
     .SetQExternalAccuracy "1e-4" 
     .SetMaterialEvaluationFrequency "True", "" 
     .SetTDCompatibleMaterials "False" 
     .SetOrderTet "2" 
     .SetUseSensitivityAnalysis "False" 
     .SetConsiderLossesInPostprocessingOnly "True" 
     .SetUseParallelization "True"
     .SetMaxNumberOfThreads "48"
     .SetRemoteCalculation "False"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"

'@ define background

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Mue "1.0"
     .Sigma "3.2e6"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.0"
     .HeatCapacity "0.0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.501961", "0.501961", "0.501961" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ define eigenmode solver parameters

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
Mesh.SetCreator "High Frequency" 
EigenmodeSolver.Reset 
With Solver
     .CalculationType "Eigenmode" 
     .AKSReset 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
End With
With EigenmodeSolver 
     .SetMethod "AKS" 
     .SetMeshType "Tetrahedral Mesh" 
     .SetMeshAdaptationHex "False" 
     .SetMeshAdaptationTet "True" 
     .SetNumberOfModes "9" 
     .SetStoreResultsInCache "True" 
     .SetCalculateExternalQFactor "False" 
     .SetConsiderStaticModes "True" 
     .SetCalculateThermalLosses "True" 
     .SetModesInFrequencyRange "False" 
     .SetFrequencyTarget "True", "1" 
     .SetAccuracy "1e-6" 
     .SetQExternalAccuracy "1e-4" 
     .SetMaterialEvaluationFrequency "True", "" 
     .SetTDCompatibleMaterials "False" 
     .SetOrderTet "2" 
     .SetUseSensitivityAnalysis "False" 
     .SetConsiderLossesInPostprocessingOnly "True" 
     .SetUseParallelization "True"
     .SetMaxNumberOfThreads "48"
     .SetRemoteCalculation "False"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"

'@ define background

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 

With Material 
     .Reset 
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Mue "1.0"
     .Sigma "3.2e6"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.0"
     .HeatCapacity "0.0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.501961", "0.501961", "0.501961" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With 


'@ define lorentz force computation settings

'[VERSION]2015.6|24.0.2|20151030[/VERSION]
With EigenmodeSolver
     .ResetForceCalculation
     .CalculateLorentzForceForMode "9"
End With


