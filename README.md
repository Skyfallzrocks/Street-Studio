# Street Studio 0.1.0 — experimental build

A standalone Cities: Skylines II code mod based on the supplied MIT-licensed Road Builder source. Road Builder does not need to be installed. This is a working-source and compiled development release, not a finished implementation of every tool in the reference images.

## Install

1. Close Cities: Skylines II.
2. Extract the release ZIP.
3. Copy the complete `StreetStudio` folder from the ZIP into:
   `%USERPROFILE%\AppData\LocalLow\Colossal Order\Cities Skylines II\Mods`
   The final file must be `Mods\StreetStudio\StreetStudio.dll`, with its `.mjs`, `.css`, native libraries, `Icons`, and `images` beside it.
   If using this unpacked deliverable, the folder to copy is `Package\StreetStudio`.
4. For initial testing, disable Road Builder in the active playset and use a new test city with code mods enabled. The two mods have independent data and component identities; sharing their runtime modifications has not been tested.
5. Start the game and click the Street Studio road icon at the top left.

An optional `Install-StreetStudio.ps1` copies the same files. It refuses to overwrite an existing installation unless run with `-Update`, which first makes a backup. The ZIP does not install or enable itself automatically.

## Make your first street

1. Place a normal road segment with the game's road tool.
2. Open Street Studio and click that segment. Choose **Use As Template** to make a separate design, or edit an existing Street Studio design.
3. Select **City Standard**, **Bus Corridor**, **Bike Friendly**, **Boulevard**, **Main Street**, **Transit Avenue**, or **Green Corridor**.
4. In **Quick Design**, adjust traffic lane count, sidewalk width, median, speed, bikes, buses, parking, trees, grass and markings. Press **Apply Design** to replace the entire cross-section with that asphalt recipe.
5. For individual edits, add an element from the library. Select a layout section and use **Selected Lane** to change its available width, direction, decoration or parking style. Move, duplicate or remove sections with labeled buttons. These edits update live.
6. **Undo / Redo** restores up to 30 changes during the current editing session. Keyboard shortcuts are Ctrl+Z, Ctrl+Y or Ctrl+Shift+Z when a text field is not focused.
7. **Save Template** saves the currently applied design to the local library. **Templates** opens that library; **Build this road** returns to the game's placement tool. **Copy design** starts a separate design on the selected segment when you next edit it.

Quick Design is a replacement recipe. Its controls do not read back an arbitrary existing street's layout. Selecting a preset does not apply it until you press Apply Design. The road's measured width appears above the game view after applying. Editing an existing design changes all segments that use it; this scope is shown below the road name.

## What is included

- Street Studio identity, UI bindings, localization keys, settings, thumbnails, prefab components and storage folders.
- Dark, blue-accented workspace inspired by the references, with a transparent center for the actual game view.
- Searchable lane library; travel, transit, parking, sidewalk and median categories; individual section editing and advanced road options.
- Seven quick recipes, application validation, undo/redo, duplicate lanes, local template saving and placement through the game's road tool.
- Road Builder's underlying road generation, save serialization, road management and custom lane setup panel in the asset editor, adapted to Street Studio's component namespace.
- Offline operation. The upstream online discovery/upload service is disconnected and its UI entry points are hidden. No Road Builder API keys are needed.

## Screenshot feature coverage

| Reference feature | This build |
| --- | --- |
| Traffic lanes, bus lanes, parking | Supported lane sections; presets put optional bus/parking lanes on both sides. Individual lanes can be moved or removed. |
| Bike lanes | Uses the game's integrated bike-sidewalk variants for road recipes. Standalone bike-path lanes remain available for compatible paths. |
| Medians | Continuous 1, 2 or 5 m medians. Trees/grass on compatible 5 m sections. **RRFB Beacons** checkbox places Rectangular Rapid Flashing Beacons (needs the *Rectangular Rapid Flashing Beacons Set* from Paradox Mods enabled) on the median at both ends of every segment. |
| Sidewalk widths | Uses available game variants. Bike sidewalks select a compatible combined section (3.5–7 m); their width includes the bike section. |
| Trees and grass | Actual game decoration flags on compatible sidewalk/median sections. Narrow or bike sections have fewer decoration choices. |
| Markings | Available traffic/parking section marking options. |
| Total road width | Measured from the generated sections; controlled through section widths and lane count rather than an arbitrary stretch slider. |
| Templates, reset, undo/redo | Local design library, recipe reset and editing-session undo/redo. |
| Intersections, crosswalks, lights, stops, standard bridges/tunnels | Underlying game behavior and game placement/service tools. The UI explains where those tools are used. No dedicated Street Studio node editor. |
| Freeform islands, pedestrian refuges, curb bulb-outs, corner radius, island height/length | **Not implemented.** These require additional geometry and junction systems. |
| Custom tactile pads, painted crosswalk patterns, arbitrary arrows | **Not implemented.** |
| Individual benches, bins, lamps, planters, signs, fences/walls/banners | **No individual prop-placement system.** Use the game's asset tools. |
| Custom bridge styles, camera mode buttons, asset browser | **Not implemented as dedicated Street Studio tools.** Use the game's camera and asset tools. |
| Online discovery/sharing | Not included. Local template files can be copied manually. |

## Storage and compatibility

Designs: `%USERPROFILE%\AppData\LocalLow\Colossal Order\Cities Skylines II\ModsData\StreetStudio`

Settings: the game's `ModsSettings\StreetStudio` folder. Options are available under **Street Studio** in the game's Options screen. Assign the tool shortcut there if desired.

This fork uses separate component types and generated prefab names. Existing Road Builder saves, custom lane assets and road JSON are **not guaranteed to migrate**. No Road Builder data has been changed. Cities using Street Studio roads need Street Studio to reconstruct them when loaded. Keep the mod available for those cities.

## Validation

Built against the installed Cities: Skylines II 1.6.2.0 managed libraries and official modding toolchain. C# build, Unity postprocessing, Burst output and production UI build passed with zero build warnings/errors. Backend checks passed for snapshots, nested lane option isolation, undo identity preservation, recipe parsing/validation and greenery state flags. Browser checks passed for preset application bindings, add/remove lanes, help, feature guidance and template save bindings. The interface was visually checked at 1600×1000 and 1280×800.

**Not yet tested inside a running city.** Road generation, placement, junction behavior, save/load, traffic, asset-editor behavior and interactions with other mods still need in-game testing. The browser preview uses fixture data and does not simulate Cities: Skylines II.

## Source and credits

The source archive contains a Visual Studio solution and `Build.ps1`. Building requires the official game modding toolchain, Node.js and .NET. It stages output locally into `Package\StreetStudio` rather than automatically installing it. The build script uses .NET runtime roll-forward for the installed postprocessor.

Road Builder source: JadHajjar / T. D. W., Trejak and BadPeanut. Original MIT copyright and license are retained in `LICENSE`. The unmodified upstream README is preserved in the source as `UPSTREAM-README.md`. Street Studio changes include the workspace, recipe workflow, history, independent identity and local-only service behavior. Street Studio is an independent fork, not an official release or endorsement by the upstream authors or the game publisher.
