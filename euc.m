function Xdis=euc(x,center_point)

Xdis=sqrt(transpose(sum((transpose((x-center_point).^2)))));

end