function plotvector(start,endvec,color,label)
%Arrowline 3-D vector plot.
%   plotvector(start,endvec) plots a line vector with arrow pointing from point start
%   to point endvec. The function can plot both 2D and 3D vector with arrow
%   depending on the dimension of the input
%
%   Example:
%       3D vector
%       start = [1 2 3];   % Coordinate of the first point start
%       endvec = [4 5 6];   % Coordinate of the second point endvec
%       plotvector(start,endvec)
%
%       2D vector
%       start = [1 2];     % Coordinate of the first point start
%       endvec = [4 5];     % Coordinate of the second point endvec
%       plotvector(start,endvec)
%
%   See also Vectline
%   Rentian Xiong 4-18-05
%   $Revision: 1.0
  if max(size(start))==3
      if max(size(endvec))==3
          x0 = start(1);
          y0 = start(2);
          z0 = start(3);
          x1 = endvec(1);
          y1 = endvec(2);
          z1 = endvec(3);
          if label
            plot3([x0;x1],[y0;y1],[z0;z1],'Color',color,'DisplayName', label);   % Draw a line between start and endvec
          else
              plot3([x0;x1],[y0;y1],[z0;z1],'Color',color,'HandleVisibility', 'off');
          end
          p = endvec-start;
          alpha = 0.2;  % Size of arrow head relative to the length of the vector
          beta = 0.2;  % Width of the base of the arrow head relative to the length
          
          hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
          hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
          hw = [z1-alpha*p(3);z1;z1-alpha*p(3)];
          
          hold on
          plot3(hu(:),hv(:),hw(:),'Color',color, 'HandleVisibility', 'off')  % Plot arrow head
          grid on
          xlabel('x')
          ylabel('y')
          zlabel('z')
          hold off
      else
          error('start and endvec must have the same dimension')
      end
  elseif max(size(start))==2
      if max(size(endvec))==2
          x0 = start(1);
          y0 = start(2);
          x1 = endvec(1);
          y1 = endvec(2);
          plot([x0;x1],[y0;y1],'Color',color, 'HandleVisibility', 'off');   % Draw a line between start and endvec
          
          p = endvec-start;
          alpha = 0.1;  % Size of arrow head relative to the length of the vector
          beta = 0.1;  % Width of the base of the arrow head relative to the length
          
          hu = [x1-alpha*(p(1)+beta*(p(2)+eps)); x1; x1-alpha*(p(1)-beta*(p(2)+eps))];
          hv = [y1-alpha*(p(2)-beta*(p(1)+eps)); y1; y1-alpha*(p(2)+beta*(p(1)+eps))];
          
          hold on
          plot(hu(:),hv(:),'Color',color,'HandleVisibility', 'off')  % Plot arrow head
          grid on
          xlabel('x')
          ylabel('y')
          hold off
      else
          error('start and endvec must have the same dimension')
      end
  else
      error('this function only accepts 2D or 3D vector')
  end