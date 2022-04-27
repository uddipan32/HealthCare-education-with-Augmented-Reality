* copy the sceneform_sdk to android>app>build
* pubspec.yaml add -> arcore_flutter_plugin: ^0.0.11

* AndroidManifest.xml
	add these lines after <manifesr xml.....> -->
    		<uses-permission android:name="android.permission.CAMERA" />
    		<uses-feature android:name="android.hardware.camera.ar" />

	add this line after </activity> -->
		<meta-data android:name="com.google.ar.core" android:value="required" />
* android>app>build.gradle
	add this line -->
		apply plugin: 'com.google.ar.sceneform.plugin'

		minSdkVersion 24
	add these in dependencies -->
		implementation 'com.google.ar.sceneform.ux:sceneform-ux:1.13.0'
    		implementation 'com.google.ar.sceneform:core:1.13.0'
    		implementation 'com.google.ar:core:1.13.0'
* android>build.gradle
	add this in dependencies -->
		classpath 'com.google.ar.sceneform:plugin:1.13.0'
* assets import ->

	sceneform.asset('sampledata/Cube/scene.gltf',
        	'default',
        	'sampledata/Cube/scene.sfa',
        	'src/main/assets/cubeModel')


	sceneform.asset('sampledata/Anubis Statue/scene.gltf',
        	'default',
        	'sampledata/Anubis Statue/scene.sfa',
        	'src/main/assets/statueModel')

	sceneform.asset('sampledata/Suzanne/scene.sfa',
        	'src/main/assets/suzanneModel')

* conver fbx model to sceneform model -->
	converter -a -d --mat ..\default_materials\fbx_material.sfm --outdir ..\..\..\sampledata\Arm ..\..\..\sampledata\Arm\arm.fbx --norecenter --scale_override 1
* copy the sfb file to android>app>src>main>assets
* changes in sfa file
	source: -> build/sceneform_sdk/default_materials/fbx_material.sfm
	file: -> sampledata/Arm/arm.fbx

## COMMAND TO CONVERT FBX FILE TO SCENEFORM FILE
converter -a -d --mat ..\default_materials\fbx_material.sfm --outdir ..\demo_output\ ..\demo_output\suzanne.fbx --norecenter --scale_override 1