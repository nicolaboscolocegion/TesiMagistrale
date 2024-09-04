

### Random citation 
\cite{alecci2021development}. \\
### Random footnote.
\footnote{\url{https://lucamartinelli.eu.org}}

### random acroninum 
\ac{CSV} 

### quote
\begin{displayquote}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
\end{displayquote}


### schema:

\tikzset{vertex style/.style={
    draw=#1,
    thick,
    fill=#1!70,
    text=white,
    ellipse,
    minimum width=2cm,
    minimum height=0.75cm,
    font=\small,
    outer sep=3pt,
  },
  text style/.style={
    sloped,
    text=black,
    font=\footnotesize,
    above
  }
}

\begin{figure}[ht]
    \centering
    \begin{tikzpicture}[node distance=2.75cm,>={Stealth[]}]
        \node[vertex style=cyan] (Rk) {Righteous Kill};
        \node[vertex style=orange, above of=Rk,xshift=2em] (BD) {Bryan Dennehy}
        edge [<-,cyan!60!blue] node[text style,above]{starring} (Rk);
    \end{tikzpicture}
    
    \caption{Image created with TikZ} \label{fig:T1}
\end{figure}

### code
\begin{lstlisting}[language=Python, caption=Code snippet example]
import numpy as np
    
def incmatrix(genl1,genl2):
    m = len(genl1)
    n = len(genl2)
    M = None #to become the incidence matrix
    VT = np.zeros((n*m,1), int)  #dummy variable

    
    return M
\end{lstlisting}