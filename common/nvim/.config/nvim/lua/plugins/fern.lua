return {
	{
		'lambdalisue/fern.vim',
		config = function()
			vim.cmd[[
			let g:fern#disable_default_mappings = 1
			let g:fern#default_hidden = 1

			let g:fern_git_status#disable_ignored = 1
			let g:fern_git_status#disable_untracked = 0
			let g:fern_git_status#disable_submodules = 1
			let g:fern_git_status#disable_directories = 1

			let g:fern#renderer#default#leading = "  "
			let g:fern#renderer#default#leaf_symbol = "│ "
			" let g:fern#renderer#default#collapsed_symbol = " "
			" let g:fern#renderer#default#expanded_symbol = " "
			let g:fern#renderer#default#collapsed_symbol = "+ "
			let g:fern#renderer#default#expanded_symbol = "- "

			function! FernInit() abort
				nmap <buffer><expr>
				\ <Plug>(fern-my-open-expand-collapse)
				\ fern#smart#leaf(
				\   "\<Plug>(fern-action-open:select)",
				\   "\<Plug>(fern-action-expand)",
				\   "\<Plug>(fern-action-collapse)",
				\ )
				nmap <buffer><expr>
				\ <Plug>(fern-my-tab)
				\ fern#smart#leaf(
				\   "\<Plug>(fern-action-collapse)",
				\   "\<Plug>(fern-action-expand)",
				\   "\<Plug>(fern-action-collapse)",
				\ )
				nmap <buffer><nowait> <CR> <Plug>(fern-action-mark:toggle)
				nmap <buffer><nowait> <TAB> <Plug>(fern-my-open-expand-collapse)
				nmap <buffer><nowait> <S-CR> <Plug>(fern-action-open)
				nmap <buffer><nowait> n <Plug>(fern-action-new-path)
				nmap <buffer><nowait> d <Plug>(fern-action-remove)
				nmap <buffer><nowait> m <Plug>(fern-action-move)
				nmap <buffer><nowait> r <Plug>(fern-action-rename)
				nmap <buffer><nowait> ! <Plug>(fern-action-hidden:toggle)
				nmap <buffer><nowait> R <Plug>(fern-action-reload)
				nmap <buffer><nowait> s <Plug>(fern-action-open:split)
				nmap <buffer><nowait> v <Plug>(fern-action-open:vsplit)
				nmap <buffer><nowait> T <Plug>(fern-action-open:tabedit)
				nmap <buffer><nowait> < <Plug>(fern-action-leave)
				nmap <buffer><nowait> > <Plug>(fern-action-enter)
				nmap <buffer><nowait> o <Plug>(fern-action-open:system)
				nmap <buffer><nowait> c <Plug>(fern-action-cd:cursor)
				nmap <buffer><nowait> y <Plug>(fern-action-clipboard-copy)
				nmap <buffer><nowait> Y <Plug>(fern-action-yank-path)
				nmap <buffer><nowait> p <Plug>(fern-action-clipboard-paste)
				nmap <buffer><nowait> P <Plug>(fern-action-preview:toggle)
				nmap <buffer><nowait><silent> q :bd<CR>

				nmap <buffer><nowait> <C-f> <Plug>(fern-action-preview:scroll:down:half)
				nmap <buffer><nowait> <C-b> <Plug>(fern-action-preview:scroll:up:half)

				nmap <buffer><nowait> bb <Plug>(fern-action-save-as-bookmark)
				nmap <buffer><nowait> bf <Plug>(fern-action-new-branch)
				nmap <buffer><nowait> bn <Plug>(fern-action-new-leaf)
			endfunction

			augroup FernGroup
				autocmd!
				autocmd FileType fern call FernInit()
			augroup END
			]]
		end
	},
	{
		'lambdalisue/fern-git-status.vim',
		dependencies = { 'lambdalisue/fern.vim' }
	},
	{
		'lambdalisue/fern-mapping-mark-children.vim',
		dependencies = { 'lambdalisue/fern.vim' }
	},
	{
		'lambdalisue/fern-bookmark.vim',
		dependencies = { 'lambdalisue/fern.vim' }
	},
	{
		'yuki-yano/fern-preview.vim',
		dependencies = { 'lambdalisue/fern.vim' }
	},
	{
		'lambdalisue/fern-mapping-quickfix.vim',
		dependencies = { 'lambdalisue/fern.vim' }
	},
}
