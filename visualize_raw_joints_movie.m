function [] = visualize_raw_joints_movie(joints)
    s = size(joints);
    s = s(1);

    for i = 1:1:s
        visualize_raw_joints(joints,i);
        pause(0.01);
        clf;
    end
    close();
end

