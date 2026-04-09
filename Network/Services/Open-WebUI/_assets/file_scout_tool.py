"""
title: NetYeti File Scout
author: Garth Johnson (The NetYeti)
version: 1.0.0
description: Instructional tool for safely exploring and reading files within the authorized container environment.
"""

import os
import glob
from typing import List, Union

class Tools:
    def __init__(self):
        # We start in the app's data directory by default
        self.base_path = "/app/backend/data"

    def list_files(self, directory: str = ".") -> str:
        """
        List all files and folders in a given directory.
        :param directory: Relative path to explore (defaults to current).
        """
        try:
            target = os.path.normpath(os.path.join(self.base_path, directory))
            if not target.startswith(self.base_path):
                return "Error: Access denied. Stay within the authorized zone."
            
            if not os.path.exists(target):
                return f"Error: Path {directory} does not exist."

            items = os.listdir(target)
            return "\n".join(sorted(items)) if items else "Directory is empty."
        except Exception as e:
            return f"Error: {str(e)}"

    def read_content(self, file_path: str) -> str:
        """
        Read the text content of a specific file.
        :param file_path: The relative path to the file you want to read.
        """
        try:
            target = os.path.normpath(os.path.join(self.base_path, file_path))
            if not target.startswith(self.base_path):
                return "Error: Access denied. Stay within the authorized zone."
            
            if not os.path.isfile(target):
                return "Error: That's not a file I can read."

            with open(target, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            return f"Error: {str(e)}"

    def find_markdown(self, pattern: str = "**/*.md") -> str:
        """
        Search for Markdown files using a glob pattern. Useful for finding notes.
        :param pattern: The search pattern (e.g., '**/*.md').
        """
        try:
            search_pattern = os.path.join(self.base_path, pattern)
            matches = glob.glob(search_pattern, recursive=True)
            # Make paths relative for the user
            relative_matches = [os.path.relpath(m, self.base_path) for m in matches]
            return "\n".join(relative_matches) if relative_matches else "No matches found."
        except Exception as e:
            return f"Error: {str(e)}"
