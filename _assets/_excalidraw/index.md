---
title: Excalidraw Assets
---
Contents:
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE join(sort(rows.file.link), " | ") as Documents
FLATTEN regexreplace(file.folder, ".*/", "") as lastPart
WHERE contains(file.folder, this.file.folder)
GROUP BY lastPart as Folder
SORT lastPart
```
%%

| Folder | Documents |
| --- | --- |
| Libraries |  |
| Scripts | [[_assets/_excalidraw/Scripts/Downloaded/Add Connector Point|Add Connector Point]] | [[_assets/_excalidraw/Scripts/Downloaded/Add Link to Existing File and Open|Add Link to Existing File and Open]] | [[_assets/_excalidraw/Scripts/Downloaded/Add Link to New Page and Open|Add Link to New Page and Open]] | [[_assets/_excalidraw/Scripts/Downloaded/Add Next Step in Process|Add Next Step in Process]] | [[_assets/_excalidraw/Scripts/Downloaded/Auto Layout|Auto Layout]] | [[_assets/_excalidraw/Scripts/Downloaded/Boolean Operations|Boolean Operations]] | [[_assets/_excalidraw/Scripts/Downloaded/Box Each Selected Groups|Box Each Selected Groups]] | [[_assets/_excalidraw/Scripts/Downloaded/Box Selected Elements|Box Selected Elements]] | [[_assets/_excalidraw/Scripts/Downloaded/Change shape of selected elements|Change shape of selected elements]] | [[_assets/_excalidraw/Scripts/Downloaded/Concatenate lines|Concatenate lines]] | [[_assets/_excalidraw/Scripts/Downloaded/Connect elements|Connect elements]] | [[_assets/_excalidraw/Scripts/Downloaded/Convert freedraw to line|Convert freedraw to line]] | [[_assets/_excalidraw/Scripts/Downloaded/Convert selected text elements to sticky notes|Convert selected text elements to sticky notes]] | [[_assets/_excalidraw/Scripts/Downloaded/Convert text to link with folder and alias|Convert text to link with folder and alias]] | [[_assets/_excalidraw/Scripts/Downloaded/Copy Selected Element Styles to Global|Copy Selected Element Styles to Global]] | [[_assets/_excalidraw/Scripts/Downloaded/Text Aura|Text Aura]] | [[_assets/_excalidraw/Scripts/Downloaded/Text to Path|Text to Path]] | [[_assets/_excalidraw/Scripts/Downloaded/Toggle Grid|Toggle Grid]] |

%% DATAVIEW_PUBLISHER: end %%