# Autogenerated wrapper script for Git_jll for i686-w64-mingw32
export git

using LibCURL_jll
using Expat_jll
using OpenSSL_jll
using Gettext_jll
using Libiconv_jll
using PCRE2_jll
using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `git`
const git_splitpath = ["bin", "git.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
git_path = ""

# git-specific global declaration
function git(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ';', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ';', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(git_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Git")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (LibCURL_jll.PATH_list, Expat_jll.PATH_list, OpenSSL_jll.PATH_list, Gettext_jll.PATH_list, Libiconv_jll.PATH_list, PCRE2_jll.PATH_list, Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (LibCURL_jll.LIBPATH_list, Expat_jll.LIBPATH_list, OpenSSL_jll.LIBPATH_list, Gettext_jll.LIBPATH_list, Libiconv_jll.LIBPATH_list, PCRE2_jll.LIBPATH_list, Zlib_jll.LIBPATH_list,))

    global git_path = normpath(joinpath(artifact_dir, git_splitpath...))

    push!(PATH_list, dirname(git_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

