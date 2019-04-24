function f_faces = fillFaces(faces, masks)
    f_faces = cell(6,1);
    for i=1:6;
        faces{i} = im2double(faces{i});
    end
    empty = zeros(1,1,3); empty(:) = [180,180,180]./255;
    
    f_faces{1} = repmat(double(masks{1}),[1,1,3]).*faces{1} + ...
                 repmat((1-double(masks{1})),[1,1,3]).*flipdim(faces{1},2) + ...
                 repmat((1-double((masks{1}|fliplr(masks{1})))),[1,1,3]).*faces{6} + ... 
                 repmat((1-double((masks{1}|fliplr(masks{1})|masks{6}))),[1,1,3]).*...
                     repmat(empty,[size(faces{1},1),size(faces{1},2)]);
             
    f_faces{2} = repmat(double(masks{2}),[1,1,3]).*faces{2} + ...
                 repmat((1-double(masks{2})),[1,1,3]).*flipdim(faces{2},2) + ...
                 repmat((1-double((masks{2}|fliplr(masks{2})))),[1,1,3]).*faces{4} + ... 
                 repmat((1-double((masks{2}|fliplr(masks{2})|masks{4}))),[1,1,3]).*...
                     repmat(empty,[size(faces{2},1),size(faces{2},2)]);
             
    f_faces{3} = repmat(double(masks{3}),[1,1,3]).*faces{3} + ...
                 repmat((1-double(masks{3})),[1,1,3]).*flipdim(faces{3},1) + ...
                 repmat((1-double((masks{3}|flipud(masks{3})))),[1,1,3]).*faces{5} + ... 
                 repmat((1-double((masks{3}|flipud(masks{3})|masks{5}))),[1,1,3]).*...
                     repmat(empty,[size(faces{3},1),size(faces{3},2)]);
             
    f_faces{4} = repmat(double(masks{4}),[1,1,3]).*faces{4} + ...
                 repmat((1-double(masks{4})),[1,1,3]).*flipdim(faces{4},2) + ...
                 repmat((1-double((masks{4}|fliplr(masks{4})))),[1,1,3]).*faces{2} + ... 
                 repmat((1-double((masks{4}|fliplr(masks{4})|masks{2}))),[1,1,3]).*...
                     repmat(empty,[size(faces{4},1),size(faces{4},2)]);
             
    f_faces{5} = repmat(double(masks{5}),[1,1,3]).*faces{5} + ...
                 repmat((1-double(masks{5})),[1,1,3]).*flipdim(faces{5},1) + ...
                 repmat((1-double((masks{5}|flipud(masks{5})))),[1,1,3]).*faces{3} + ... 
                 repmat((1-double((masks{5}|flipud(masks{5})|masks{3}))),[1,1,3]).*...
                     repmat(empty,[size(faces{5},1),size(faces{5},2)]);
        
    f_faces{6} = repmat(double(masks{6}),[1,1,3]).*faces{6} + ...
                 repmat((1-double(masks{6})),[1,1,3]).*flipdim(faces{6},2) + ...
                 repmat((1-double((masks{6}|fliplr(masks{6})))),[1,1,3]).*faces{1} + ... 
                 repmat((1-double((masks{6}|fliplr(masks{6})|masks{1}))),[1,1,3]).*...
                     repmat(empty,[size(faces{6},1),size(faces{6},2)]);
end