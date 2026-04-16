---
title: copilot
---
## Contents:
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
| copilot-conversations | [[_assets/copilot/copilot-conversations/Cleanup_redundancies_and_repetitious_content_in_the_main_index@20260408_200826|Cleanup_redundancies_and_repetitious_content_in_the_main_index@20260408_200826]] | [[_assets/copilot/copilot-conversations/Rewrite_this_page_to_remove_repetitive_and_redundant_content.@20260408_190859|Rewrite_this_page_to_remove_repetitive_and_redundant_content.@20260408_190859]] | [[_assets/copilot/copilot-conversations/The_vault's_main_index.md_document_still_seems_to_have_a@20260408_210133|The_vault's_main_index.md_document_still_seems_to_have_a@20260408_210133]] | [[_assets/copilot/copilot-conversations/There_is_still_some_redundancy_in_the_index.md_page._Please@20260408_204530|There_is_still_some_redundancy_in_the_index.md_page._Please@20260408_204530]] |
| copilot-custom-prompts | [[_assets/copilot/copilot-custom-prompts/Clip Web Page|Clip Web Page]] | [[_assets/copilot/copilot-custom-prompts/Clip YouTube Transcript|Clip YouTube Transcript]] | [[_assets/copilot/copilot-custom-prompts/Emojify|Emojify]] | [[_assets/copilot/copilot-custom-prompts/Explain like I am 5|Explain like I am 5]] | [[_assets/copilot/copilot-custom-prompts/Fix grammar and spelling|Fix grammar and spelling]] | [[_assets/copilot/copilot-custom-prompts/Generate glossary|Generate glossary]] | [[_assets/copilot/copilot-custom-prompts/Generate table of contents|Generate table of contents]] | [[_assets/copilot/copilot-custom-prompts/Make longer|Make longer]] | [[_assets/copilot/copilot-custom-prompts/Make shorter|Make shorter]] | [[_assets/copilot/copilot-custom-prompts/Remove URLs|Remove URLs]] | [[_assets/copilot/copilot-custom-prompts/Rewrite as tweet thread|Rewrite as tweet thread]] | [[_assets/copilot/copilot-custom-prompts/Rewrite as tweet|Rewrite as tweet]] | [[_assets/copilot/copilot-custom-prompts/Simplify|Simplify]] | [[_assets/copilot/copilot-custom-prompts/Summarize|Summarize]] | [[_assets/copilot/copilot-custom-prompts/Translate to Chinese|Translate to Chinese]] |

%% DATAVIEW_PUBLISHER: end %%

## Recent Changes / Additions
%% DATAVIEW_PUBLISHER: start
```dataview
TABLE 
  file.ctime AS "Created", 
  file.mtime AS "Updated"
WHERE file.cday >= date(today) - dur(7 days)
  OR file.mday >= date(today) - dur(7 days)
WHERE contains(file.folder, this.file.folder)
SORT file.mtime DESC
LIMIT 20
```
%%

| File | Created | Updated |
| --- | --- |
| [[_assets/copilot/index|index]] | 12:26 AM - April 16, 2026 | 12:26 AM - April 16, 2026 |
| [[_assets/copilot/copilot-conversations/Rewrite_this_page_to_remove_repetitive_and_redundant_content.@20260408_190859|Rewrite_this_page_to_remove_repetitive_and_redundant_content.@20260408_190859]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-conversations/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-conversations/The_vault's_main_index.md_document_still_seems_to_have_a@20260408_210133|The_vault's_main_index.md_document_still_seems_to_have_a@20260408_210133]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-conversations/There_is_still_some_redundancy_in_the_index.md_page._Please@20260408_204530|There_is_still_some_redundancy_in_the_index.md_page._Please@20260408_204530]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-conversations/Cleanup_redundancies_and_repetitious_content_in_the_main_index@20260408_200826|Cleanup_redundancies_and_repetitious_content_in_the_main_index@20260408_200826]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Clip Web Page|Clip Web Page]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Generate glossary|Generate glossary]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Fix grammar and spelling|Fix grammar and spelling]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Simplify|Simplify]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Remove URLs|Remove URLs]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Clip YouTube Transcript|Clip YouTube Transcript]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Make shorter|Make shorter]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Summarize|Summarize]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Translate to Chinese|Translate to Chinese]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Generate table of contents|Generate table of contents]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Rewrite as tweet thread|Rewrite as tweet thread]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Emojify|Emojify]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/index|index]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |
| [[_assets/copilot/copilot-custom-prompts/Make longer|Make longer]] | 2:06 PM - April 14, 2026 | 2:06 PM - April 14, 2026 |

%% DATAVIEW_PUBLISHER: end %%
