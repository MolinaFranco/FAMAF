
// en in out redis tiene que controlar que 
// cada comando tengo o un redir in desde el comando
// o si viene desde una pipe_prev o pipe_next

// 0 entrada stdin
// 1 salida stdout





int main(int argc, char const *argv[])
{

    // aca usando pipe
    // int fd = open("file.out", | O_CREATE)
    // int fd[2];
    // pipe(fd);

    // fd[0]->lee
    // fd[1]->escribe


    else if !child 
     fork 
     if child 
        dup2
        close
        execvp


    return 0;
}



// ls | greep "hola"

int main(int argc, char const *argv[])
{
    if((id1 = fork())==0){
    
        int fd[2];
        pipe(fd);

        // if((pid=fork())==0){
        if((id2 = fork())==0){
            // hijo
            close(fd[0]);
            dup2(fd[1], STDOUT_FILENO);
            char* ls = {"ls",NULL};
            execvp(ls[0],ls);

        }else{
            // padre
            // waitpid(pid,NULL,0);
            close(fd[1]);
            dup2(fd[0], STDIN_FILENO);
            char* greep = {"greep", "hola.txt",NULL};
            execvp(greep[0],greep);
        }
    }else{
        waitpid(id1);
        waitpid(id2);
    }
    return 0;
}

// ls > "hola.txt"

int main(int argc, char const *argv[])
{
    int out = open("ls.out", O_WRONLY, );
    dup2(out, STDOUT_FILENO);
    char* ls_list[3] = {"ls", "-l", NULL};
    execvp(ls_list[0], ls_list);
    return 0;
}




