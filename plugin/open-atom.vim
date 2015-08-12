scriptencoding utf-8

function! s:open_atom(file)
  if get(g:, 'open_atom_silent_simojo_atom', 1)
    redraw!
    echo "Vimmerウルルン滞在記: Vim が... Atom に... 出合った..."
    echo ""
    echo "                     #    #                                                    "
    echo "###############      #    #                                                    "
    echo "      #             #    ######                        #                       "
    echo "      #             #    #   #      #    #####          #              #       "
    echo "      #            ## # # # #        ####    #          #               #      "
    echo "      #           # # #    #                #           #               #      "
    echo "      #  #       #  # #  ## ##          #  #            #               #      "
    echo "      #   #         # ###  #  ##         ##             ###            #       "
    echo "      #    #        # #    #             #              #  ##          #       "
    echo "      #     #       # # #######          #              #    #         #  #    "
    echo "      #     #       # #    #             #              #             #    #   "
    echo "      #             # #  # # #          #               #             #    ##  "
    echo "      #             # # #  #  #         #               #          # #  ###  # "
    echo "      #             #  #   #   #       #                #           ####     # "
    echo "      #             #    # #          #                 #                      "
    echo "      #             #     #                                                    "
  endif
  let f = len(a:file) > 0 ? fnamemodify(a:file, ':p') : expand('%:p')
  let opts = get(g:, 'open_atom_unix_options', '')
  if has("win32") || has("win64")
    silent exec "!start cmd /c call atom " . shellescape(f)
  else
    silent exec "!atom " . shellescape(opts) . ' ' . shellescape(f) " &"
  endif
endfunction

command! -nargs=? -complete=file OpenAtom call s:open_atom(<q-args>)
