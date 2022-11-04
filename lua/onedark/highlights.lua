local c = require('onedark.colors')
local cfg = vim.g.onedark_config

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
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
    Substitute = {fg = c.bg0, bg = c.green},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
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
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue},
    FloatBorder = {fg = c.grey, bg = c.bg1},
    NormalFloat = {fg = c.fg, bg = c.bg1},
    Strong= { fg = c.fg, style = "bold,underline" },
    Emphasis= { fg = c.fg, style = "bold" },
    Underline= { fg = c.fg, style = "underline" },
    Strike= { fg = c.fg, style = "strikethrough" },

}

hl.syntax = {
    String = colors.Yellow,
    Character = colors.Fg,
    Number = colors.Purple,
    Float = colors.Orange,
    Boolean = colors.Orange,
    Type = colors.Cyan,
    Structure = colors.Yellow,
    StorageClass = colors.Yellow,
    Identifier = colors.Red,
    Constant = colors.Red,
    PreProc = colors.Purple,
    PreCondit = colors.Purple,
    Include = colors.Red,
    Keyword = colors.Red,
    Define = colors.Purple,
    Typedef = colors.Purple,
    Exception = colors.Purple,
    Conditional = colors.Purple,
    Repeat = colors.Purple,
    Statement = colors.Purple,
    Macro = colors.Red,
    Error = colors.Red,
    Label = colors.Blue,
    Special = {fg = c.yellow, bold = true},
    SpecialChar = colors.Red,
    Function = colors.Green,
    Operator = colors.Fg,
    Title = colors.Red,
    Tag = colors.Red,
    Delimiter = colors.LightGrey,
    Comment = {fg = c.grey, italic = cfg.italic_comment},
    SpecialComment = {fg = c.grey, italic = cfg.italic_comment},
    Todo = {fg = c.red, italic = cfg.italic_comment}
}

hl.treesitter = {
    ["@annotation"] = colors.Green,
    ["@attribute"] = colors.Cyan,
    ["@boolean"] = hl.syntax.Boolean,
    ["@character"] = hl.syntax.Character,
    ["@comment"] = hl.syntax.Comment,
    ["@conditional"] = hl.syntax.Conditional,
    ["@constant"] = hl.syntax.Constant,
    ["@constant.builtin"] = hl.syntax.Special,
    ["@constant.macro"] = hl.syntax.Define,
    ["@constructor"] = hl.syntax.Special,
    ["@error"] = hl.syntax.Error,
    ["@exception"] = hl.syntax.Exception,
    ["@field"] = colors.Cyan,
    ["@float"] = hl.syntax.Float,
    ["@function"] = hl.syntax.Function,
    ["@function.builtin"] = colors.Green,
    ["@function.macro"] = colors.Orange,
    ["@include"] = hl.syntax.include,
    ["@keyword"] = hl.syntax.Keyword,
    ["@keyword.function"] = {fg = c.red, bold = true},
    ["@keyword.operator"] = colors.Red,
    ["@label"] = hl.syntax.Label,
    ["@method"] = colors.Blue,
    ["@namespace"] = colors.Purple,
    ["@none"] = colors.Fg,
    ["@number"] = hl.syntax.Number,
    ["@operator"] = hl.syntax.Operator,
    ["@parameter"] = colors.Orange,
    ["@parameter.reference"] = colors.Orange,
    ["@property"] = colors.Blue,
    ["@punctuation"] = colors.LightGrey,
    ["@punctuation.delimiter"] = colors.LightGrey,
    ["@punctuation.bracket"] = colors.LightGrey,
    ["@punctuation.special"] = colors.LightGrey,
    ["@repeat"] = hl.syntax.Repeat,
    -- ["@spell"] = colors.Fg, -- TODO: not sure what this one should be
    ["@string"] = hl.syntax.String,
    ["@string.regex"] = colors.Orange,
    ["@string.escape"] = colors.Red,
    ["@symbol"] = colors.Cyan,
    ["@tag"] = hl.syntax.Tag,
    ["@tag.delimiter"] = colors.Red,
    ["@text"] = colors.Fg,
    ["@strong"] = hl.common.Strong,
    ["@emphasis"] = hl.common.Emphasis,
    ["@underline"] = hl.common.Underline,
    ["@strike"] = hl.common.Strike,
    ["@title"] = hl.syntax.Title,
    ["@literal"] = colors.Green,
    ["@uri"] = colors.Orange,
    ["@math"] = colors.Fg,
    ["@text.reference"] = colors.Blue,
    ["@text.strong"] = hl.common.Strong,
    ["@text.emphasis"] = hl.common.Emphasis,
    ["@enviroment"] = colors.Fg,
    ["@enviroment.name"] = colors.Fg,
    ["@note"] = colors.Purple,
    ["@warning"] = colors.Orange,
    ["@danger"] = colors.Red,
    ["@type"] = hl.syntax.Type,
    ["@type.builtin"] = colors.Orange,
    ["@variable"] = colors.Orange,
    ["@variable.builtin"] = colors.Red
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
    CmpItemKindClass = hl.treesitter['@namespace'],
    CmpItemKindFile = colors.Yellow,
    CmpItemKindFolder = colors.Blue,
    CmpItemKindFunction = hl.treesitter['@function'],
    CmpItemKindKeyword = hl.treesitter['@keyword'],
    CmpItemKindMethod = hl.treesitter['@method'],
    CmpItemKindReference = hl.treesitter['@parameter.reference'],
    CmpItemKindSnippet = colors.Purple,
    CmpItemKindVariable = hl.treesitter['@variable'],
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

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('onedark.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "onedark.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.onedark_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M

