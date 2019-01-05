using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;

// Output the build size or a failure depending on BuildPlayer.

public class BuildClass : MonoBehaviour {
    public static void AppBuild () {
        BuildPlayerOptions buildPlayerOptions = new BuildPlayerOptions ();
        buildPlayerOptions.options = BuildOptions.None;
        buildPlayerOptions.scenes = new [] {
            "Assets/Scenes/SampleScene.unity"
        };

#if UNITY_STANDALONE_OSX
        Debug.Log ("Target OSX");
        buildPlayerOptions.locationPathName = "Build/SampleScene";
        buildPlayerOptions.target = BuildTarget.StandaloneOSX;
#elif UNITY_STANDALONE_WIN
        Debug.Log ("Target Windows");
        buildPlayerOptions.locationPathName = "Build/SampleScene.exe";
        buildPlayerOptions.target = BuildTarget.StandaloneWindows64;
#endif

        BuildReport report = BuildPipeline.BuildPlayer (buildPlayerOptions);
        BuildSummary summary = report.summary;

        if (summary.result == BuildResult.Succeeded) {
            Debug.Log ("Build succeeded: " + summary.totalSize + " bytes");
        }

        if (summary.result == BuildResult.Failed) {
            Debug.Log ("Build failed");
        }
    }
}