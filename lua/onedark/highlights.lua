local c = require('onedark.colors')
local cfg = require('onedark.config')

local M = {}
local hl = {langs = {}, plugins = {}}

local function gui(group_settings)
   if group_settings.bold then return "bold"
   elseif group_settings.underline then return "underline"
   elseif group_settings.undercurl then return "undercurl"
   elseif group_settings.italic then return "italic"
   elseif group_settings.reverse then return "reverse"
   else return "NONE" end
end

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    local fg = group_settings.fg and "guifg=" .. group_settings.fg or "guifg=NONE"
    local bg = group_settings.bg and "guibg=" .. group_settings.bg or "guibg=NONE"
    local sp = group_settings.sp and "guisp=" .. group_settings.sp or "guisp=NONE"
    vim.cmd("highlight " .. group_name .. " ".."gui="..gui(group_settings).." "..fg .. " " .. bg .. " " .. sp)
	end
end


local colors = {
    Fg = {fg = c.fg},
    LightGrey = {fg = c.light_grey},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}

hl.common = {
    Normal = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    Terminal = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    EndOfBuffer = {fg = cfg.hide_ending_tildes and (cfg.bg and c.none or c.bg0) or c.bg2, bg = cfg.bg and c.none or c.bg0},
    FoldColumn = {fg = c.fg, bg = cfg.bg and c.none or c.bg1},
    Folded = {fg = c.fg, bg = cfg.bg and c.none or c.bg1},
    SignColumn = {fg = c.fg, bg = cfg.bg and c.none or c.bg0},
    ToolbarLine = {fg = c.fg},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.Green,
    DiffRemoved = colors.Red,
    DiffFile = colors.Cyan,
    DiffIndexLine = colors.Grey,
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, bold = true, underline = true},
    WarningMsg = {fg = c.yellow, bold = true},
    MoreMsg = {fg = c.blue, bold = true},
    IncSearch = {fg = c.bg0, bg = c.orange},
    Search = {fg = c.bg0, bg = c.bg_yellow},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    FloatMenu = {fg = c.fg, bg = c.bg1},
    FloatMenuBorder = {fg = c.bg2},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.red, underline = true, sp = c.red},
    SpellCap = {fg = c.yellow, underline = true, sp = c.yellow},
    SpellLocal = {fg = c.blue, underline = true, sp = c.blue},
    SpellRare = {fg = c.purple, underline = true, sp = c.purple},
    StatusLine = {fg = c.fg, bg = c.bg2},
    StatusLineTerm = {fg = c.fg, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.bg1},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel =  {fg = c.bg0, bg = c.fg},
    VertSplit = {fg = c.bg1},
    Visual = {bg = c.bg3},
    VisualNOS = {fg = c.none, bg = c.bg2, underline = true},
    QuickFixLine = {fg = c.blue, underline = true},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.red},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue}
}

hl.syntax = {
    String = colors.Green,
    Character = colors.Orange,
    Number = colors.Orange,
    Float = colors.Orange,
    Boolean = colors.Orange,
    Type = colors.Yellow,
    Structure = colors.Yellow,
    StorageClass = colors.Yellow,
    Identifier = colors.Red,
    Constant = colors.Cyan,
    PreProc = colors.Purple,
    PreCondit = colors.Purple,
    Include = colors.Purple,
    Keyword = colors.Purple,
    Define = colors.Purple,
    Typedef = colors.Purple,
    Exception = colors.Purple,
    Conditional = colors.Purple,
    Repeat = colors.Purple,
    Statement = colors.Purple,
    Macro = colors.Red,
    Error = colors.Purple,
    Label = colors.Purple,
    Special = colors.Red,
    SpecialChar = colors.Red,
    Function = colors.Blue,
    Operator = colors.Red,
    Title = colors.Cyan,
    Tag = colors.Green,
    Delimiter = colors.LightGrey,
    Comment = {fg = c.grey, italic = cfg.italic_comment},
    SpecialComment = {fg = c.grey, italic = cfg.italic_comment},
    Todo = {fg = c.red, italic = cfg.italic_comment}
}

hl.treesitter = {
    TSAnnotation = colors.Green,
    TSAttribute = colors.Cyan,
    TSBoolean = colors.Orange,
    TSCharacter = colors.Fg,
    TSComment = {fg = c.grey, italic = cfg.italic_comment},
    TSConditional = colors.Purple,
    TSConstant = colors.Red,
    TSConstBuiltin = colors.Red,
    TSConstMacro = colors.Red,
    TSConstructor = {fg = c.yellow, bold = true},
    TSError = colors.Fg,
    TSException = colors.Purple,
    TSField = colors.Cyan,
    TSFloat = colors.Orange,
    TSFunction = colors.Green,
    TSFuncBuiltin = colors.Green,
    TSFuncMacro = colors.Orange,
    TSInclude = colors.Red,
    TSKeyword = colors.Red,
    TSKeywordFunction = {fg = c.red, bold = true},
    TSKeywordOperator = colors.Red,
    TSLabel = colors.Blue,
    TSMethod = colors.Blue,
    TSNamespace = colors.Purple,
    TSNone = colors.Fg,
    TSNumber = colors.Purple,
    TSOperator = colors.Fg,
    TSParameter = colors.Orange,
    TSParameterReference = colors.Orange,
    TSProperty = colors.Blue,
    TSPunctDelimiter = colors.LightGrey,
    TSPunctBracket = colors.LightGrey,
    TSPunctSpecial = colors.LightGrey,
    TSRepeat = colors.Purple,
    TSString = colors.Yellow,
    TSStringRegex = colors.Orange,
    TSStringEscape = colors.Red,
    TSSymbol = colors.Cyan,
    TSTag = colors.Red,
    TSTagDelimiter = colors.Red,
    TSText = colors.Fg,
    TSStrong = colors.Fg,
    TSEmphasis = colors.Fg,
    TSUnderline = colors.Fg,
    TSStrike = colors.Fg,
    TSTitle = colors.Red,
    TSLiteral = colors.Green,
    TSURI = colors.Orange,
    TSMath = colors.Fg,
    TSTextReference = colors.Blue,
    TSEnviroment = colors.Fg,
    TSEnviromentName = colors.Fg,
    TSNote = colors.Fg,
    TSWarning = colors.Fg,
    TSDanger = colors.Fg,
    TSType = colors.Blue,
    TSTypeBuiltin = colors.Orange,
    TSVariable = colors.Orange,
    TSVariableBuiltin = colors.Red
}

hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,
    LspDiagnosticsDefaultError = {fg = cfg.darker_diagnostics and c.dark_red or c.red},
    LspDiagnosticsDefaultHint = {fg = cfg.darker_diagnostics and c.dark_purple or c.purple},
    LspDiagnosticsDefaultInformation = {fg = cfg.darker_diagnostics and c.dark_cyan or c.cyan},
    LspDiagnosticsDefaultWarning = {fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow},
    LspDiagnosticsUnderlineError = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.red},
    LspDiagnosticsUnderlineHint = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.purple},
    LspDiagnosticsUnderlineInformation = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.blue},
    LspDiagnosticsUnderlineWarning = {underline = not cfg.diagnostics_undercurl, undercurl = cfg.diagnostics_undercurl, sp = c.yellow},
    LspReferenceText = {underline = true },
    LspReferenceWrite = {underline = true },
    LspReferenceRead = {underline = true },
    LspDiagnosticsVirtualTextError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    LspDiagnosticsVirtualTextWarning = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    LspDiagnosticsVirtualTextInformation = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    LspDiagnosticsVirtualTextHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    LspDiagnosticsFloatingError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    LspDiagnosticsFloatingWarning = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    LspDiagnosticsFloatingInformation = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    LspDiagnosticsFloatingHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    DiagnosticFloatingError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    DiagnosticFloatingWarn = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    DiagnosticFloatingInfo = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    DiagnosticFloatingHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    LspDiagnosticsSignError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    LspDiagnosticsSignWarning = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    LspDiagnosticsSignInformation = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    LspDiagnosticsSignHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    DiagnosticSignError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    DiagnosticSignWarn = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    DiagnosticSignInfo = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    DiagnosticSignHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    LspDiagnosticsError = { fg = cfg.darker_diagnostics and c.dark_red or c.red },
    LspDiagnosticsWarning = { fg = cfg.darker_diagnostics and c.dark_orange or c.orange },
    LspDiagnosticsInformation = { fg = cfg.darker_diagnostics and c.dark_yellow or c.yellow },
    LspDiagnosticsHint = { fg = cfg.darker_diagnostics and c.dark_purple or c.purple },
    DiagnosticUnderlineError = { style = "underline" },
    DiagnosticUnderlineWarn = { style = "underline" },
    DiagnosticUnderlineInfo = { style = "underline" },
    DiagnosticUnderlineHint = { style = "underline" },
}

hl.plugins.whichkey = {
    WhichKey = colors.Red,
    WhichKeyDesc = colors.Blue,
    WhichKeyGroup = colors.Orange,
    WhichKeySeperator = colors.Green,
    WhichKeyFloat = hl.common.FloatMenu,
}

hl.plugins.lightspeed = {
    LightspeedLabel = { fg = c.fg, style = "bold" },
    LightspeedLabelOverlapped = { fg = c.fg, style = "bold,underline" },
    LightspeedLabelDistant = { fg = c.cyan, style = "bold" },
    LightspeedLabelDistantOverlapped = { fg = c.cyan, style = "bold,underline" },
    LightspeedShortcut = { fg = c.purple, style = "bold" },
    LightspeedShortcutOverlapped = { fg = c.purple, style = "bold,underline" },
    LightspeedMaskedChar = { fg = c.blue },
    LightspeedGreyWash = { fg = c.grey},
    LightspeedUnlabeledMatch = { fg = c.lightGrey },
    LightspeedOneCharMatch = { fg = c.fg, style = "bold,reverse" },
    LightspeedUniqueChar = { fg = c.green, style = "bold,underline" },
    -- LightspeedPendingOpArea = { style = "strikethrough" },
    -- LightspeedPendingChangeOpArea = { style = "strikethrough" },
    -- LightspeedCursor = { fg = colors.nord7_gui, style = "underline,reverse" },
    --
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, bold = true},
    DiffviewFilePanelCounter = {fg = c.purple, bold = true},
    DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Green,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Green,
    DiffviewStatusUntracked = colors.Blue,
    DiffviewStatusModified = colors.Blue,
    DiffviewStatusRenamed = colors.Blue,
    DiffviewStatusCopied = colors.Blue,
    DiffviewStatusTypeChange = colors.Blue,
    DiffviewStatusUnmerged = colors.Blue,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.Green,
    GitSignsAddLn = colors.Green,
    GitSignsAddNr = colors.Green,
    GitSignsChange = colors.Blue,
    GitSignsChangeLn = colors.Blue,
    GitSignsChangeNr = colors.Blue,
    GitSignsDelete = colors.Red,
    GitSignsDeleteLn = colors.Red,
    GitSignsDeleteNr = colors.Red
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.hide_ending_tildes and c.bg_d or c.bg2, bg = c.bg_d },
    NvimTreeRootFolder = { fg = c.green, bold =true},
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, underline=true },
    NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName= colors.Blue
}

hl.plugins.telescope = {
    TelescopeBorder = colors.Green,
    TelescopePromptBorder = colors.Green,
    TelescopeResultsBorder = colors.Green,
    TelescopePreviewBorder = colors.Green,
    TelescopeMatching = colors.Yellow,
    TelescopePromptPrefix = colors.Blue,
    TelescopeSelection =  { bg =c.bg2 },
    TelescopeSelectionCaret = colors.Blue
}

hl.plugins.cmp = {
    CmpDocumentation = hl.common.FloatMenu,
    CmpDocumentationBorder = hl.common.FloatMenuBorder,
    CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = colors.Red,
    CmpItemAbbrMatch = colors.Yellow,
    CmpItemAbbrMatchFuzzy = colors.Yellow,
    CmpItemKind = colors.Blue,
    CmpItemMenu = colors.Grey,
    CmpItemKindClass = hl.treesitter.TSNamespace,
    CmpItemKindFile = colors.Yellow,
    CmpItemKindFolder = colors.Blue,
    CmpItemKindFunction = hl.treesitter.TSFunction,
    CmpItemKindKeyword = hl.treesitter.TSKeyword,
    CmpItemKindMethod = hl.treesitter.TSMethod,
    CmpItemKindReference = hl.treesitter.TSParameterReference,
    CmpItemKindSnippet = colors.Purple,
    CmpItemKindVariable = hl.treesitter.TSVariable,
}

hl.plugins.indent_blankline = {
    IndentBlanklineIndent1 = { fg = c.fg, gui = "nocombine" },
    IndentBlanklineIndent2 =  { fg = c.grey, gui = "nocombine" },
    IndentBlanklineIndent3 =  { fg = c.dark_yellow, gui = "nocombine" },
    IndentBlanklineIndent4 =  { fg = c.dark_red, gui = "nocombine" },
    IndentBlanklineIndent5 =  { fg = c.dark_cyan, gui = "nocombine" },
    IndentBlanklineIndent6 =  { fg = c.dark_blue, gui = "nocombine" },
}

function M.setup()
    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end
end

return M

