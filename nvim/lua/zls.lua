local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

confis.zls = {
	default_config = {
		cmd = {"~/.nix-profile/bin/zls"};
		filetypes = {"zig"};
		root_dir = util.root_pattern("build.zig", ".git");
	};
	docs = {
		description = [[ ]];
		default_config = {
			root_dir = [[root_pattern("build.zig", ".git")]];
		};
	};
}
